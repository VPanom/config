#/bin/bash

REPO_ROOT_PATH=$(git rev-parse --show-toplevel)

if [ -d ~/.config/nvim ]; then
	echo "Backing up existing nvim config"
	mv ~/.config/nvim ~/.config/nvim.backup
fi

mkdir -p ~/.config
ln -sf "$REPO_ROOT_PATH/nvim" ~/.config/nvim
