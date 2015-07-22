# -*- coding: utf-8 -*-

include_recipe "install_modules.rb"

install_modules 'perl' do
  cmd 'anyenv install plenv'
end

install_modules 'perl' do
  cmd <<-EOF
    plenv install #{node[:perl][:ver]}
    plenv global  #{node[:perl][:ver]}
  EOF
end

install_modules 'perl' do
  cmd <<-EOF
    plenv install-cpanm
    cpanm #{node[:perl][:cpan_install]}
    plenv rehash
  EOF
end
