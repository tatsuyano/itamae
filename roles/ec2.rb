# roles/ec2

# $ itamae ssh -h [host] roles/ec2.rb -j node.json

include_recipe "../cookbooks/basic-command/default.rb"
include_recipe "../cookbooks/emacs/default.rb"
include_recipe "../cookbooks/zsh/default.rb"
