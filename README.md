# workstation-setup

This project contains my .bash_profile, .prompt, and a setup script.

# usage

```
git clone git@github.com:iparips/workstation-setup.git
cd workstation-setup
./setup.sh
```

# what setup.sh does / installs

- homebrew
- git
- chruby
- ruby
- z
- soft links ~/.bash_profile & ~/.prompt to workstation-setup bash profile & prompt scripts
- sources bash profile
- installs withenv

# things to install via brew

brew install git z nvm chruby thefuck bash-git-prompt ag jq
