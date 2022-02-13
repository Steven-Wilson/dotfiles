sudo pacman -Syu
sudo pacman -S \
    git \
    feh \
    mpv \
    picom \
    rofi \
    qtile \
    herbstluftwm \
    neovim \
    dunst \
    fish \
    wine \
    winetricks \
    wine-gecko \
    wine-mono \
    ranger \
    poppler \
    w3m \
    zathura \
    zathura-pdf-poppler \
    xdotool \
    rsync \
    pass

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p \
	~/.config/dunst \
	~/.config/fish \
	~/.config/nvim \
	~/.config/qtile \
	~/.config/rofi \
	~/.config/herbstluftwm \
	~/.config/xfce4/terminal

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/dotfiles/.config/fish/fish.config ~/.config/fish/fish.config
ln -sf ~/dotfiles/.config/fish/fish_variables ~/.config/fish/fish_variables
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.config/qtile/autostart.sh ~/.config/qtile/autostart.sh
ln -sf ~/dotfiles/.config/qtile/config.py ~/.config/qtile/config.py
ln -sf ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/dotfiles/.config/rofi/one-dark.rasi ~/.config/rofi/one-dark.rasi
ln -sf ~/dotfiles/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
ln -sf ~/dotfiles/.config/herbstluftwm/autostart ~/.config/herbstluftwm/autostart

