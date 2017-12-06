DOT_FOLDER = $(shell grealpath .)

all: install

install:
	rm -rf ~/.zgen
	git clone https://github.com/rslindee/zgen.git ~/.zgen
	# git clone https://github.com/tarjoilija/zgen.git ~/.zgen
	ln -sfnv $(DOT_FOLDER)/vim ~/.vim
	ln -sfnv $(DOT_FOLDER)/zsh ~/.zsh
	ln -sfnv $(DOT_FOLDER)/dot/gitconfig ~/.gitconfig
	ln -sfnv $(DOT_FOLDER)/dot/ideavimrc ~/.ideavimrc
	ln -sfnv $(DOT_FOLDER)/dot/vimrc ~/.vimrc
	ln -sfnv $(DOT_FOLDER)/dot/zshrc ~/.zshrc
	vim -c :PlugInstall
