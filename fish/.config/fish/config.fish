set GRADLE_USER_HOME "~/.gradle"

set -x GOPATH $HOME/golang
set -x GOROOT /usr/local/opt/go/libexec
set -x GO111MODULE on
set PATH $GOPATH/bin $GOROOT/bin $PATH

set EDITOR code -w

add_secrets

# Set default directory
cd ~/src/ea/r
