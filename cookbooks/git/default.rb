# -*- coding: utf-8 -*-

package 'curl-devel'
package 'expat-devel'
package 'gettext-devel'
package 'openssl-devel'
package 'zlib-devel'
package 'perl-ExtUtils-MakeMaker'

execute "Install git-2.4.6" do
  user node[:user]
  command <<-EOF
    sudo yum -y remove git
    wget https://www.kernel.org/pub/software/scm/git/git-2.4.6.tar.gz
    tar -xvzf git-2.4.6.tar.gz
    cd git-2.4.6
    make prefix=/usr/local all
    sudo make prefix=/usr/local install
    ../
    rm -rf git-2.4.6 git-2.4.6.tar.gz
    sudo ln -s /usr/local/bin/git /usr/bin/git
  EOF
  not_if "test -e /usr/local/bin/git"
end
