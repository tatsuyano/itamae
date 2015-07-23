# -*- coding: utf-8 -*-

package 'libtool'
package 'flex'

execute "Install bison 3" do
  user node[:user]
  command <<-EOF
    wget http://ftp.gnu.org/gnu/bison/bison-3.0.2.tar.gz
    tar xvzf bison-3.0.2.tar.gz
    cd bison-3.0.2
    ./configure
    make
    sudo make install
    cd ../
    rm -rf bison-3.0.2 bison-3.0.2.tar.gz 
    sudo ln -s /usr/local/bin/bison /usr/bin/bison
    alias yacc='bison'
  EOF
  not_if "test -e /usr/local/bin/bison"
end

execute "Install oniguruma" do
  user node[:user]
  command <<-EOF
    wget http://www.geocities.jp/kosako3/oniguruma/archive/onig-5.9.5.tar.gz
    tar xvzf onig-5.9.5.tar.gz
    cd onig-5.9.5
    ./configure --prefix=/usr
    make
    sudo make install
    cd ../
    rm -rf onig-5.9.5 onig-5.9.5.tar.gz
    sudo ldconfig
  EOF
end

execute "Install jq" do
  user node[:user]
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$GOPATH/bin:$PATH
    ghq get https://github.com/stedolan/jq.git
    cd src/github.com/stedolan/jq
    autoreconf -i
    ./configure
    make
    sudo make install
  EOF
  not_if "test -e /usr/local/bin/jq"
end
