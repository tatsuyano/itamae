# -*- coding: utf-8 -*-

execute "Install golang" do
  user "root"
  command <<-EOF
    yum list | grep golang.x86_64
    if [ "$?" -eq 1 ]; then
      rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    fi
    yum -y install golang
  EOF
  not_if "test -e /usr/bin/go"
end
