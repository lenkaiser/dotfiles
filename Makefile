DOT_FOLDER = $(shell grealpath .)

.PHONY: all
all: clean install

.PHONY: install
install: zgen link
	sh $(DOT_FOLDER)/.macos
	vim -c :PlugInstall

.PHONY: zgen
zgen:
	git clone https://github.com/rslindee/zgen.git ~/.zgen
	# git clone https://github.com/tarjoilija/zgen.git ~/.zgen

.PHONY: link
link:
	ln -sfnv $(DOT_FOLDER)/vim ~/.vim
	ln -sfnv $(DOT_FOLDER)/zsh ~/.zsh
	ln -sfnv $(DOT_FOLDER)/dot/gitconfig ~/.gitconfig
	ln -sfnv $(DOT_FOLDER)/dot/ideavimrc ~/.ideavimrc
	ln -sfnv $(DOT_FOLDER)/dot/vimrc ~/.vimrc
	ln -sfnv $(DOT_FOLDER)/dot/zshrc ~/.zshrc

.PHONY: clean
clean:
	rm -rf ~/.zgen
