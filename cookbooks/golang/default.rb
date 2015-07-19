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

## The directory layout to the format of the golang

%w(bin pkg src).each do |d|
  directory "/home/#{node[:user]}/#{d}" do
    mode "775"
    owner node[:user]
    group node[:user]
  end
end

package 'git'
file  "/home/#{node[:user]}/.gitconfig" do
  content "[ghq]\n    root = ~/src"
  mode "644"
  owner node[:user]
  group node[:user]
end

execute "Install ghq" do
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$PATH:$GOPATH/bin
    go get github.com/motemen/ghq
    chown -R #{node[:user]}:#{node[:user]} bin
    chown -R #{node[:user]}:#{node[:user]} pkg
    chown -R #{node[:user]}:#{node[:user]} src
  EOF
  not_if "test -e /home/node[:user]/bin/ghq"
end
