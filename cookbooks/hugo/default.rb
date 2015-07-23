# -*- coding: utf-8 -*-

execute "Install Mercurial" do  
  user "root"
  command <<-EOF
    rpm -ivh https://mercurial.selenic.com/release/centos6/RPMS/x86_64/mercurial-3.5-rc.x86_64.rpm
  EOF
  not_if "test -e /usr/bin/hg"
end

execute "Install Hugo" do
  user node[:user]
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$PATH:$GOPATH/bin
    go get -v github.com/spf13/hugo
  EOF
  not_if "test -e /home/node[:user]/bin/hugo"
end
