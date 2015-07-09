# -*- coding: utf-8 -*-

%w(git tig tmux wget tree).each do |p|
  user "root"
  package p
end

execute "Install nkf at RPM" do
  command <<-EOF
    wget http://mirror.centos.org/centos/6/os/x86_64/Packages/nkf-2.0.8b-6.2.el6.x86_64.rpm
    sudo rpm -ivh nkf-2.0.8b-6.2.el6.x86_64.rpm
  EOF
  not_if "test -e '/usr/bin/nkf"
end
