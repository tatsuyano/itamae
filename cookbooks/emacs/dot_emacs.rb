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
    ln -s src/github.com/tatsuyano/dot.emacs.d/tern-config .tern-config
    cd .emacs.d
    /home/#{node[:user]}/.cask/bin/cask
    cd init_loader
    find ~/.emacs.d/.cask -name 'dict' -print0 | xargs -0 -I % ln -s %
    cd dict
    wget https://raw.github.com/sandai/dotfiles/master/.emacs.d/ac-dict/js2-mode
    cp -a css-mode scss-mode
  EOF
  not_if "test -e /home/#{node[:user]}/src/github.com/tatsuyano/dot.emacs.d"
end
