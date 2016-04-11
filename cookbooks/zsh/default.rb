# -*- coding: utf-8 -*-

%w(gcc ncurses-devel).each do |p|
  user "root"
  package p
end

execute "Install zsh-5.1.0" do
  command <<-EOF
    wget http://sourceforge.net/projects/zsh/files/zsh/5.1/zsh-5.1.tar.gz
    tar xvzf zsh-5.1.tar.gz
    cd zsh-5.1
    ./configure
    make
    sudo make install
    cd ../
    sudo rm -rf zsh-5.1 zsh-5.1.tar.gz
  EOF
  not_if "test -e /usr/local/bin/zsh"
end

execute "Create link" do
  user "root"
  command "ln -s /usr/local/bin/zsh /usr/bin/zsh"
  only_if "test -e /usr/local/bin/zsh"
end

execute "Add zsh to '/etc/shells'" do
  user "root"
  command "echo '/usr/local/bin/zsh' >> /etc/shells"
  not_if "grep '/usr/local/bin/zsh' /etc/shells"
end

execute "Change shell to zsh" do
  user "root"
  command "chsh -s /usr/local/bin/zsh #{node[:user]}"
  only_if "test -e /usr/local/bin/zsh"
end
