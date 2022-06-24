sudo pacman -Syu
sudo pacman -S \
    calc \
    dunst \
    feh \
    fish \
    git \
    herbstluftwm \
    i3-gaps \
    mpv \
    neovim \
    nerd-fonts-terminus \
    networkmanager-dmenu \
    noto-fonts \
    pass \
    picom \
    polybar \
    poppler \
    python-pywal \
    qtile \
    ranger \
    rofi \
    rsync \
    ttf-droid \
    ttf-fantasque-sans-mono \
    ttf-icomoon-icons \
    ttf-iosevka-nerd \
    ttf-material-design-icons-webfont \
    ttf-nerd-fonts-symbols \
    w3m \
    wine \
    wine-gecko \
    wine-mono \
    winetricks \
    xclip \
    xdotool \
    zathura \
    zathura-pdf-poppler

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


cd $HOME
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh


mkdir -p \
	~/.config/dunst \
	~/.config/fish \
	~/.config/nvim \
	~/.config/qtile \
	~/.config/rofi \
	~/.config/herbstluftwm \
	~/.config/xfce4/terminal \
    ~/.config/i3 \
    ~/.config/polybar

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
ln -sf ~/dotfiles/.config/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/.config/polybar/launch.sh ~/.config/polybar/launch.sh

