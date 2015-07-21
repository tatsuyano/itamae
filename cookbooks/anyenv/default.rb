# -*- coding: utf-8 -*-

execute "Install anyenv" do
  user node[:user]
  command <<-EOF
    git clone https://github.com/riywo/anyenv.git ~/.anyenv
  EOF
  not_if "test -e /home/#{node[:user]}/.anyenv"
end
