# -*- coding: utf-8 -*-

include_recipe "install_modules.rb"

install_modules 'node' do
  cmd 'anyenv install ndenv'
end

install_modules 'node' do
  cmd <<-EOF
    ndenv install #{node[:nodejs][:ver]}
    ndenv global  #{node[:nodejs][:ver]}
  EOF
end

install_modules 'node' do
  cmd <<-EOF
    npm install -g #{node[:nodejs][:npm_install]}
    ndenv rehash
  EOF
end
