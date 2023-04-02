# Upgrade full system
sudo pacman -Syu

# Install default applications
sudo pacman -S \
    firefox \
    alacritty \
    thunar

# Terminal programs
sudo pacman -S \
    ranger \
    fish \
    git \
    calc \
    neovim \
    rsync

# Window Manager utils
sudo pacman -S \
    picom \
    xclip \
    xdotool \
    polybar \
    dunst \
    udiskie \
    feh \
    rofi \
    sxhkd

# install window managers
sudo pacman -S \
    i3-gaps \
    herbstluftwm \
    qtile

# Fonts
sudo pacman -S \
    noto-fonts \
    ttf-droid \
    ttf-fantasque-sans-mono \
    ttf-iosevka-nerd \
    ttf-nerd-fonts-symbols-common \
    ttf-nerd-fonts-symbols-2048-em-mono

# Multimedia and documents
sudo pacman -S \
    w3m \
    mpv \
    poppler \
    zathura \
    zathura-pdf-poppler

# Install and setup a wine prefix
sudo pacman -S \
    wine \
    wine-gecko \
    wine-mono \
    winetricks

