# -*- coding: utf-8 -*-

execute "Update yum repo" do
  user "root"
  command "yum -y update"
end

# Install git, wget and tree.
%w(git wget tree).each do |p|
  user "root"
  package p
end

# Install tig and tmux.
%w(tig tmux).each do |p|
  execute "Install #{p}" do
    user "root"
    command <<-EOF
      yum list | grep #{p}.x86_64
      if [ "$?" -eq 1 ]; then
        rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
      fi
      yum -y install #{p}
    EOF
    not_if "test -e /usr/bin/#{p}"
  end
end

# $HOME/.tmux.conf
remote_file "/home/#{node[:user]}/.tmux.conf" do
  owner #{node[:user]}
  group #{node[:user]}
  source "templates/home/user/tmux.conf"
end

execute "Install nkf" do
  user "root"
  command <<-EOF
    yum list | grep nkf.x86_64
    if [ "$?" -eq 1 ]; then
      rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/nkf-2.0.8b-6.2.el6.x86_64.rpm
    fi
    yum -y install nkf  
  EOF
  not_if "test -e /usr/bin/nkf"
end
