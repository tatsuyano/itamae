## The directory layout to the format of the golang

%w(bin pkg src).each do |d|
  directory "#{d}" do
    mode "775"
    owner node[:user]
    group node[:user]
  end
end

file  ".gitconfig" do
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
    chown -R #{node[:user]}:#{node[:user]} bin pkg src
  EOF
  not_if "test -e /home/#{node[:user]}/bin/ghq"
end
