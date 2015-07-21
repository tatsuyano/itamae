execute "Install peco" do
  user "root"
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$PATH:$GOPATH/bin
    go get github.com/peco/peco/cmd/peco
    chown -R #{node[:user]}:#{node[:user]} bin pkg src
  EOF
  not_if "test -e /home/node[:user]/bin/peco"  
end

remote_directory ".peco" do
  owner node[:user]
  group node[:user]
  source "templates/peco"
end

remote_file ".oh-my-zsh/custom/peco.zsh" do
  owner node[:user]
  group node[:user]
  source "templates/oh-my-zsh/custom/peco.zsh"
end
