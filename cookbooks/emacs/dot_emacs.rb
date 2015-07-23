# -*- coding: utf-8 -*-

execute "Install cask" do
  user node[:user]
  command <<-EOF
    curl -fsSkL https://raw.github.com/cask/cask/master/go | python
  EOF
  not_if "test -e /home/#{node[:user]}/.cask/bin/cask"
end

execute "Install dot_emacs" do
  user node[:user]
  command <<-EOF
    export GOPATH=/home/#{node[:user]}
    export PATH=$GOPATH/bin:$PATH
    ghq get https://github.com/tatsuyano/dot.emacs.d.git
    rm -rf .emacs.d
    ln -s src/github.com/tatsuyano/dot.emacs.d .emacs.d
    cd .emacs.d
    /home/#{node[:user]}/.cask/bin/cask
  EOF
  not_if "test -e /home/#{node[:user]}/src/github.com/tatsuyano/dot.emacs.d"
end
