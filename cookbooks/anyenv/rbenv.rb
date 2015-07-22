# -*- coding: utf-8 -*-

package "openssl-devel"
package "readline-devel"

execute "Install rbenv" do
  user node[:user]
  command <<-EOF
    touch ruby_env
    echo 'export PATH=$HOME/.anyenv/bin:$PATH' >> ruby_env
    echo 'eval "$(anyenv init -)"' >> ruby_env
    source /home/#{node[:user]}/ruby_env
    anyenv install rbenv
  EOF
  not_if "test -e /home/#{node[:user]}/.anyenv/envs/rbenv"
end

execute "Install ruby" do
  user node[:user]
  command <<-EOF
    echo 'export PATH=$HOME/.anyenv/envs/rbenv/bin:$PATH' >> ruby_env
    echo 'export PATH=$HOME/.anyenv/envs/rbenv/plugins/ruby-build/bin:$PATH' >> ruby_env
    echo 'eval "$(rbenv init -)"' >> ruby_env
    source /home/#{node[:user]}/ruby_env
    rbenv install #{node[:ruby][:ver]}
    rbenv global  #{node[:ruby][:ver]}
    rm ruby_env
  EOF
  only_if "test -e /home/#{node[:user]}/.anyenv/envs/rbenv"
end
