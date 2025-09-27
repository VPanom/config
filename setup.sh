#/bin/bash

REPO_ROOT_PATH=$(git rev-parse --show-toplevel)

if [ -d ~/.config/nvim ]; then
	echo "Backing up existing nvim config"
	mv ~/.config/nvim ~/.config/nvim.backup
fi

mkdir -p ~/.config
ln -sf "$REPO_ROOT_PATH/nvim" ~/.config/nvim

if [ -f ~/.tmux.conf ]; then
	echo "Backing up .tmux.conf to ~/.tmux.conf.backup"
	mv ~/.tmux.conf ~/.tmux.conf.backup
fi

ln -sf "$REPO_ROOT_PATH/.tmux.conf" ~/.tmux.conf

if [ -d ~/.config/ghostty ]; then 
	echo "Backing up ghostty config to ~/.config/ghostty.backup"
	mv ~/.config/ghostty ~/.config/ghostty.backup
fi

ln -sf "$REPO_ROOT_PATH/ghostty" ~/.config/ghostty

if [ -d ~/.config/hypr ]; then 
	echo "Backing up hypr config to ~/.config/hypr.backup"
	mv ~/.config/hypr ~/.config/hypr.backup
fi

ln -sf "$REPO_ROOT_PATH/hypr" ~/.config/hypr

if [ -d ~/.config/waybar ]; then 
	echo "Backing up waybar config to ~/.config/waybar.backup"
	mv ~/.config/waybar ~/.config/waybar.backup
fi

ln -sf "$REPO_ROOT_PATH/waybar" ~/.config/waybar
