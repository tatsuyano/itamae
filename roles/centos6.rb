# $ itamae ssh -h [host_name] -y node.yaml roles/centos6.rb

# Target OS is Centos6 or Amazon Linux.

include_recipe "../cookbooks/basic-command/default.rb"
include_recipe "../cookbooks/golang/default.rb"
include_recipe "../cookbooks/golang/directory_layout_and_ghq.rb"
include_recipe "../cookbooks/zsh/default.rb"
include_recipe "../cookbooks/zsh/oh-my-zsh.rb"
include_recipe "../cookbooks/peco/default.rb"
include_recipe "../cookbooks/htop/default.rb"
include_recipe "../cookbooks/anyenv/default.rb"
include_recipe "../cookbooks/anyenv/ndenv.rb"
include_recipe "../cookbooks/anyenv/rbenv.rb"
include_recipe "../cookbooks/anyenv/plenv.rb"
include_recipe "../cookbooks/anyenv/pyenv.rb"
include_recipe "../cookbooks/anyenv/migemo.rb"
include_recipe "../cookbooks/emacs/default.rb"
