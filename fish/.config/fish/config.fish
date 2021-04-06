set -U fish_greeting

bind \t forward-word
bind \e\t complete

set GRADLE_USER_HOME "~/.gradle"
set -x GOPATH $HOME/golang
set -x GOROOT /usr/local/opt/go/libexec
set -x GO111MODULE on
set PATH $GOPATH/bin $GOROOT/bin $PATH

add_secrets
