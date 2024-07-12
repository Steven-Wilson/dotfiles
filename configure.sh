mkdir -p ~/.local/bin

ln -sf ~/dotfiles/.local/bin/random_quote ~/.local/bin/random_quote

mkdir -p \
    ~/.config/dunst \
    ~/.config/herbstluftwm \
    ~/.config/nvim \
    ~/.config/rofi \
    ~/.config/xfce4/terminal \
    ~/.config/i3 \
    ~/.config/i3blocks

ln -sf ~/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/dotfiles/.config/herbstluftwm/autostart ~/.config/herbstluftwm/autostart
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.config/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/.config/i3blocks/config ~/.config/i3blocks/config
ln -sf ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/dotfiles/.config/rofi/one-dark.rasi ~/.config/rofi/one-dark.rasi
ln -sf ~/dotfiles/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc

