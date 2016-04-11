# -*- coding: utf-8 -*-

%w(curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker).each do |p|
  user "root"
  package p
end

execute "Install git(not yum install)" do
  user node[:user]
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$GOPATH/bin:$PATH
    ghq get https://github.com/git/git.git
    cd src/github.com/git/git
    make all prefix=/usr
    sudo make install prefix=/usr
  EOF
end
