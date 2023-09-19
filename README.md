## New Machine Setup
### macOS
1. Install [brew](https://brew.sh/) (should also trigger installation of command-line tools)
1. `ssh-keygen -t rsa -b 4096 -C "caleb.stdenis@gmail.com"`
1. `pbcopy < ~/.ssh/id_rsa.pub`
1. [Add SSH Key](https://github.com/settings/ssh/new)
1. `cd ~`
1. `git clone git@github.com:castdin/dotfiles.git`
1. `cd dotfiles`
1. Terminal > Preferences > Import... > `~/terminal/atom/Atom.terminal`
1. `brew install stow`
1. `brew install fish`
1. `stow fish -t ~/.config`
1. `sudo sh -c "echo $(which fish) >> /etc/shells"`
1. `chsh -s $(which fish)`
1. `fundle install`
1. `stow git`
