# -*- coding: utf-8 -*-

execute "Install tig" do
  user node[:user]
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$GOPATH/bin:$PATH
    ghq get https://github.com/jonas/tig.git
    cd src/github.com/jonas/tig/
    make all prefix=/usr/local 
    sudo make install prefix=/usr/local
  EOF
  not_if "test -e /usr/local/bin/tig"
end
