# -*- coding: utf-8 -*-

execute "Update yum repo" do
  user "root"
  command "yum -y update"
end

%w(git wget tree nkf).each do |p|
  user "root"
  package p
end

execute "Install tig and tmux" do
  user "root"
  command <<-EOF
    rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
    yum -y install tig tmux
  EOF
end
