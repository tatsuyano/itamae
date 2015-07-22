# -*- coding: utf-8 -*-

include_recipe "../../cookbooks/nkf/default.rb"

execute "Install cmigemo" do
  user node[:user]
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$GOPATH/bin:$PATH
    ghq get https://github.com/koron/cmigemo.git
    cd src/github.com/koron/cmigemo
    ./configure
    make gcc
    make gcc-dict
    sudo make gcc-install
  EOF
  not_if "test -e /usr/local/bin/cmigemo"
end
