# -*- coding: utf-8 -*-

package "openssl-devel"
package "readline-devel"

include_recipe "install_modules.rb"

install_modules 'ruby' do
  cmd 'anyenv install rbenv'
end

install_modules 'ruby' do
  cmd <<-EOF
    rbenv install #{node[:ruby][:ver]}
    rbenv global  #{node[:ruby][:ver]}
  EOF
end

install_modules 'ruby' do
  cmd <<-EOF
    gem install #{node[:ruby][:gem_install]}
    rbenv rehash
  EOF
end
