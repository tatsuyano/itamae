# -*- coding: utf-8 -*-

execute "Update yum repo" do
  user "root"
  command "yum -y update"
end

%w(wget tree git tig jq).each do |p|
  user "root"
  package p
end

execute "Install tmux" do
  user "root"
  command <<-EOF
    yum list | grep tmux.x86_64
    if [ "$?" -eq 1 ]; then
      rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
    fi
    yum -y install tmux
  EOF
  not_if "test -e /usr/bin/tmux"
end

# $HOME/.tmux.conf
remote_file "/home/#{node[:user]}/.tmux.conf" do
  owner node[:user]
  group node[:user]
  source "templates/tmux.conf"
end
