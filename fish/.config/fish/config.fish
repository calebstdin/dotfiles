set GRADLE_USER_HOME "~/.gradle"

set -x GOPATH $HOME/golang
set -x GOROOT /usr/local/opt/go/libexec
set -x GO111MODULE on
set PATH $GOPATH/bin $GOROOT/bin $PATH

set EDITOR code -w

# This should always be the last line. Why? So that you're not incentivized
# to use the secrets in subsequent lines, in a way that compromises the secrets.
# Just an abundance of caution, really.
do_secret_tings
