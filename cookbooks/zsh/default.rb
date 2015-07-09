# -*- coding: utf-8 -*-

%w(gcc ncurses-devel git).each do |p|
  user "root"
  package p
end

execute "Download zsh-5.0.8 and install" do
  command <<-EOF
    wget http://www.zsh.org/pub/zsh-5.0.8.tar.bz2
    tar jxvf zsh-5.0.8.tar.bz2
    cd zsh-5.0.8
    ./configure
    make
    sudo make install
    sudo rm -rf zsh-5.0.8 zsh-5.0.8.tar.bz2
  EOF
  not_if "test -e /usr/local/bin/zsh"
end

execute "Add zsh to '/etc/shells'" do
  user "root"
  command "echo '/usr/local/bin/zsh' >> /etc/shells"
  not_if "grep '/usr/local/bin/zsh' /etc/shells"
end

#execute "Install oh-my-zsh" do
#  command "curl -L http://install.ohmyz.sh | sh"
#  only_if "test -e /usr/local/bin/zsh"
#end
