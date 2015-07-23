# -*- coding: utf-8 -*-

execute "Chage time_zone of Tokyo" do
  user "root"
  command <<-EOF
    cp -a /etc/localtime /etc/localtime.org
    cp -a /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
  EOF
end
