set GRADLE_USER_HOME "~/.gradle"

set -gx GOPATH $HOME/golang
set -gx GOROOT /usr/local/opt/go/libexec
set -gx GO111MODULE on
set -gx PATH $PATH $GOPATH/bin
set -gx PATH $PATH $GOROOT/bin
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH /opt/homebrew/bin/
set -gx PATH $PATH /opt/homebrew/opt/python@3.10/libexec/bin

set EDITOR code -w

# This should always be the last line. Why? So that you're not incentivized
# to use the secrets in subsequent lines, in a way that compromises the secrets.
# Just an abundance of caution, really.
do_secret_tings
