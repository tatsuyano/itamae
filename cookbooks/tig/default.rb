# -*- coding: utf-8 -*-

execute "Install tig" do
  user "root"
  command "yum -y install tig"
end

## http://mfham.hatenablog.com/entry/2015/04/23/021458
#execute "Moji-Bake" do
#  user node[:user]
#  command <<-EOF
#    wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.7.tar.gz
#    tar xzvf ncurses-5.7.tar.gz
#    cd ncurses-5.7
#    ./configure  --enable-widec
#    make
#    sudo make install
#    rm -rf ncurses-5.7.tar.gz ncurses-5.7
#  EOF
#end
#
#execute "Install tig(not yum install)" do
#  user node[:user]
#  command <<-EOF
#    export GOPATH=/home/#{node[:user]}
#    export PATH=$GOPATH/bin:$PATH
#    ghq get https://github.com/jonas/tig.git
#    cd src/github.com/jonas/tig
#    make prefix=/usr/local
#    sudo make install prefix=/usr/local
#  EOF
#end

## $HOME/.tigrc
#remote_file "/home/#{node[:user]}/.tigrc" do
#  owner node[:user]
#  group node[:user]
#  source "templates/tigrc"
#end
