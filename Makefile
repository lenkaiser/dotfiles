DOT_FOLDER = $(shell pwd)

.PHONY: all
all: clean install

.PHONY: path
path:
	echo $(DOT_FOLDER)

.PHONY: install
install: zgen link slate brew
	zsh ~/.zshrc

.PHONY: macos
macos:
	sh $(DOT_FOLDER)/.macos

.PHONY: zgen
zgen:
	git clone https://github.com/rslindee/zgen.git ~/.zgen
	# git clone https://github.com/tarjoilija/zgen.git ~/.zgen

.PHONY: link
link:
	ln -sfnv $(DOT_FOLDER)/zsh ~/.zsh
	ln -sfnv $(DOT_FOLDER)/dot/gitconfig ~/.gitconfig
	ln -sfnv $(DOT_FOLDER)/dot/zshrc ~/.zshrc
.PHONY: brew
brew:
	brew install brew-gem
	brew bundle
.PHONY: slate
slate:
	ln -sfnv $(DOT_FOLDER)/slate/.slate ~/.slate
.PHONY: clean
clean:
	rm -rf ~/.zgen
