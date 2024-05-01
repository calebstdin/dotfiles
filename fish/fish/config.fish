if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin edc/bass
fundle init

set -gx DENO_INSTALL /Users/c/.deno
set -gx GO111MODULE on
set -gx GRADLE_USER_HOME /Users/c/.gradle
set -gx PATH $PATH $GOPATH/bin
set -gx PATH $PATH $GOROOT/bin
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH /opt/homebrew/bin/
set -gx PATH $PATH /opt/homebrew/opt/python@3.10/libexec/bin
set -gx PATH $PATH $DENO_INSTALL/bin
set -gx PATH $PATH $HOME/.linkerd2/bin

set EDITOR code -w

# This should always be the last line. Why? So that you're not incentivized
# to use the secrets in subsequent lines, in a way that compromises the secrets.
# Just an abundance of caution, really.
do_secret_tings

# pnpm
set -gx PNPM_HOME /Users/c/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/c/src/google-cloud-sdk/path.fish.inc' ]
    . '/Users/c/src/google-cloud-sdk/path.fish.inc'
end

# Android SDK
set -gx ANDROID_HOME $HOME/Library/Android/sdk

# Created by `pipx` on 2024-04-24 23:21:17
set PATH $PATH /Users/c/.local/bin
