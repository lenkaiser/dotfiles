# My dotfiles

## Pre-install
To run the make file you need to install brew first. Run the following command to install Homebrew:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

And run:
```
gem install bundler
```

## Install

Run this command to install my dotfiles

```
https://github.com/lenkaiser/dotfiles.git && cd dotfiles && make
```

If you want to let iTerm2 start with zsh by default execute the following command:
```
chsh -s /bin/zsh
```
