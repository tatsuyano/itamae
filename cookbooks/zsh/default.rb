# -*- coding: utf-8 -*-

%w(gcc ncurses-devel git).each do |p|
  user "root"
  package p
end

execute "Install zsh-5.0.8" do
  command <<-EOF
    wget http://www.zsh.org/pub/zsh-5.0.8.tar.bz2
    tar jxvf zsh-5.0.8.tar.bz2
    cd zsh-5.0.8
    ./configure
    make
    sudo make install
    cd ../
    sudo rm -rf zsh-5.0.8 zsh-5.0.8.tar.bz2
  EOF
  not_if "test -e /usr/local/bin/zsh"
end

link "/usr/bin/zsh" do
  to "/usr/local/bin/zsh"
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

git ".oh-my-zsh" do
  repository "git://github.com/robbyrussell/oh-my-zsh.git"
  only_if "test -e /usr/local/bin/zsh"
end

execute "Setting oh-my-zsh" do
  command <<-EOF
    cp -a /home/#{node[:user]}/.oh-my-zsh/templates/zshrc.zsh-template /home/#{node[:user]}/.zshrc
    chown -R #{node[:user]}:#{node[:user]} .oh-my-zsh
    chown -R #{node[:user]}:#{node[:user]} .zshrc
    sed -i "s/robbyrussell/steeef/g" .zshrc
    echo export TMUX_MAIN_COLOR=#{node[:tmux_main_color]} >> .zshrc
  EOF
  only_if "test -e /home/#{node[:user]}/.oh-my-zsh"
end
