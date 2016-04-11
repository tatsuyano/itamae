# -*- coding: utf-8 -*-

execute "Install htop" do
  user "root"
  command <<-EOF
    yum list | grep htop.x86_64
    if [ "$?" -eq 1 ]; then
      rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
      yum --enablerepo=epel install -y htop
    else
      yum -y install htop
    fi
  EOF
  not_if "test -e /usr/bin/htop"
end
