# -*- coding: utf-8 -*-

define :install, repo: nil do
  cmd = sprintf "echo '%s' > /etc/yum.repos.d/mongodb.repo", params[:repo]
  execute 'Add MongoDB repository' do
    user 'root'
    command cmd
  end
  package 'mongodb-org'
  execute 'sudo chkconfig mongod on'

  # $HOME/.mongorc.js
  remote_file "/home/#{node[:user]}/.mongorc.js" do
    owner node[:user]
    group node[:user]
    source "templates/mongorc.js"
  end
end

install 'mongo_db' do
  repo <<-EOF
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
  EOF
end
