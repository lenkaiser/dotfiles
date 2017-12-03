ANTIBODY_STATIC_BUNDLES = ~/.antibody_bundles.zsh
USR_ANTIBODY = /usr/local/bin/antibody
DOT_FOLDER = $(shell grealpath .)

all: install

install:
	brew install getantibody/tap/antibody
	$(USR_ANTIBODY) bundle mafredri/zsh-async > $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle wbinglee/zsh-wakatime >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle rupa/z >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle Tarrasch/zsh-bd >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle b4b4r07/enhancd >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle zsh-users/zsh-completions >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle zsh-users/zsh-autosuggestions >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle RobSis/zsh-completion-generator >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle MichaelAquilina/zsh-you-should-use >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle sindresorhus/pure >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle Vifon/deer >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) bundle zsh-users/zsh-syntax-highlighting >> $(ANTIBODY_STATIC_BUNDLES)
	$(USR_ANTIBODY) update
	ln -sinv $(DOT_FOLDER)/vim ~/.vim/
	ln -sinv $(DOT_FOLDER)/zsh ~/.zsh/
	ln -sinv $(DOT_FOLDER)/dot/gitconfig ~/.gitconfig
	ln -sinv $(DOT_FOLDER)/dot/githelpers ~/.githelpers
	ln -sinv $(DOT_FOLDER)/dot/ideavimrc ~/.ideavimrc
	ln -sinv $(DOT_FOLDER)/dot/tmux.conf ~/.tmux.conf
	ln -sinv $(DOT_FOLDER)/dot/vimrc ~/.vimrc
	ln -sinv $(DOT_FOLDER)/dot/zlogin ~/.zlogin
	ln -sinv $(DOT_FOLDER)/dot/zlogout ~/.zlogout
	ln -sinv $(DOT_FOLDER)/dot/zprofile ~/.zprofile
	ln -sinv $(DOT_FOLDER)/dot/zshenv ~/.zshenv
	ln -sinv $(DOT_FOLDER)/dot/zshrc ~/.zshrc
