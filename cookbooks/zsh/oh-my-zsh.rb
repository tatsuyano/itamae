# -*- coding: utf-8 -*-

git ".oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  only_if "test -e /usr/local/bin/zsh"
end

execute "Setting oh-my-zsh" do
  command <<-EOF
    cp -a /home/#{node[:user]}/.oh-my-zsh/templates/zshrc.zsh-template /home/#{node[:user]}/.zshrc
    chown -R #{node[:user]}:#{node[:user]} .oh-my-zsh .zshrc
    sed -i "s/robbyrussell/#{node[:zsh][:theme]}/g" .zshrc
    sed -i "s/plugins=(git)/plugins=(#{node[:zsh][:plugins]})/g" .zshrc
    echo export TMUX_MAIN_COLOR=#{node[:zsh][:tmux_main_color]} >> .zshrc
  EOF
  only_if "test -e /home/#{node[:user]}/.oh-my-zsh"
end

# main.zsh
remote_file ".oh-my-zsh/custom/main.zsh" do
  owner node[:user]
  group node[:user]
  source "templates/oh-my-zsh/custom/main.zsh"
end

# z
remote_directory ".oh-my-zsh/custom/plugins/z" do
  owner node[:user]
  group node[:user]
  source "templates/oh-my-zsh/custom/plugins/z"
end

# zsh-syntax-highlighting
execute "sudo -u #{node[:user]} /home/#{node[:user]}/bin/ghq get https://github.com/zsh-users/zsh-syntax-highlighting.git"
remote_directory ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting" do
  owner node[:user]
  group node[:user]
  source "templates/oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
end
