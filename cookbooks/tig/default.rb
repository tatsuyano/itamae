# -*- coding: utf-8 -*-

execute "Install tig" do
  user "root"
  command "yum -y install tig"
end

## $HOME/.tigrc
#remote_file "/home/#{node[:user]}/.tigrc" do
#  owner node[:user]
#  group node[:user]
#  source "templates/tigrc"
#end
