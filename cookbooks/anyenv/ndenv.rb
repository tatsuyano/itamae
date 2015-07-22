# -*- coding: utf-8 -*-

include_recipe "install_node_modules.rb"

install_node_modules 'ndenv' do
  cmd 'anyenv install ndenv'
end

install_node_modules 'nodejs and npm' do
  cmd <<-EOF
    ndenv install #{node[:nodejs][:ver]}
    ndenv global  #{node[:nodejs][:ver]}
  EOF
end

install_node_modules node[:nodejs][:npm_install] do
  cmd <<-EOF
    npm install -g #{node[:nodejs][:npm_install]}
    ndenv rehash
  EOF
end
