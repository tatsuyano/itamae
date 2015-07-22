# -*- coding: utf-8 -*-

package "autoconf"
package "bzip2-devel"
package "openssl-devel"
package "readline-devel"

include_recipe "install_modules.rb"

install_modules 'python' do
  cmd 'anyenv install pyenv'
end

install_modules 'python' do
  cmd <<-EOF
    pyenv install #{node[:python][:ver3]}
    pyenv global  #{node[:python][:ver3]}
  EOF
end

install_modules 'node' do
  cmd <<-EOF
    easy_install #{node[:python][:easy_install]}
    pyenv rehash
  EOF
end
