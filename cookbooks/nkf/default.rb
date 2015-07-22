# -*- coding: utf-8 -*-

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
