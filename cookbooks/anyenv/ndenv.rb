# -*- coding: utf-8 -*-

execute "Install ndenv" do
  user node[:user]
  command <<-EOF
    touch node_env
    echo 'export PATH=$HOME/.anyenv/bin:$PATH' >> node_env
    echo 'eval "$(anyenv init -)"' >> node_env
    source /home/#{node[:user]}/node_env
    anyenv install ndenv
  EOF
  not_if "test -e /home/#{node[:user]}/.anyenv/envs/ndenv"
end

execute "Install node.js" do
  user node[:user]
  command <<-EOF
    echo 'export PATH=$HOME/.anyenv/envs/ndenv/bin:$PATH' >> node_env
    echo 'export PATH=$HOME/.anyenv/envs/ndenv/plugins/node-build/bin:$PATH' >> node_env
    echo 'eval "$(ndenv init -)"' >> node_env
    source /home/#{node[:user]}/node_env
    ndenv install v0.10.26
    ndenv global  v0.10.26
    rm node_env
  EOF
  only_if "test -e /home/#{node[:user]}/.anyenv/envs/ndenv"
end
