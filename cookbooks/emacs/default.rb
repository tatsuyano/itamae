# -*- coding: utf-8 -*-

%w(gcc ncurses-devel).each do |p|
  user "root"
  package p
end

execute "Install emacs-24.5" do
  command <<-EOF
    wget http://mirror.jre655.com/GNU/emacs/emacs-24.5.tar.gz
    tar xvzf emacs-24.5.tar.gz
    cd emacs-24.5
    ./configure
    make
    sudo make install
    sudo rm -rf emacs-24.5 emacs-24.5.tar.gz
  EOF
  not_if "test -e /usr/local/bin/emacs"
end

execute "Put a symbolic link to '/usr/bin'" do
  command <<-EOF
    ln -s /usr/local/bin/emacs /usr/bin/emacs
  EOF
  not_if "test -e /usr/bin/emacs"
end
