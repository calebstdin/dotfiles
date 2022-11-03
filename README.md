## From Scratch
### macOS
1. Install [brew](https://brew.sh/) (should also trigger installation of command-line tools)
1. `ssh-keygen -t rsa -b 4096 -C "caleb.stdenis@gmail.com"`
1. `pbcopy < ~/.ssh/id_rsa.pub`
1. [Add SSH Key](https://github.com/settings/ssh/new)
1. `cd ~`
1. `git clone git@github.com:PhantomCaleb/dotfiles.git`
2. Terminal > Preferences > Import... > `~/terminal/atom/Atom.terminal`
3. `cd dotfiles`
4. `brew install fish`
5. `sudo sh -c "echo $(which fish) >> /etc/shells"`
6. `chsh -s /usr/local/bin/fish`
7. `brew install stow`

## Stow
1. `stow fish`
1. `stow git`

etc.
