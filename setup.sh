#!/bin/bash
# Vars
RED='\033[0;31m'
NC='\033[0m'

# Defaults
export RUNZSH=no

# Install some software
if [ -f /bin/pacman ]; then
    echo -e "${RED}Arch Linux Detected${NC}"
    if [ ! -f /bin/yay ]; then
        echo -e "${RED}Yay isn't present${NC}"
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay
        makepkg -si
    fi
    yay -S polybar neofetch zsh emacs vim cmake go
elif [ -f /usr/bin/apt ]; then
    echo -e "${RED}Debian Variant Detected${NC}"
    sudo apt install neofetch zsh emacs vim-nox cmake golang
elif [ -f /usr/local/bin/brew ]; then
    echo -e "${RED}MacOS Detected${NC}"
    brew install neofetch zsh emacs vim cmake go
else
    echo -e "${RED}This OS Isn't Supported, aborting!${NC}"
    exit 1
fi

# Move Existing Configs
echo -e "${RED}Backing up existing config files${NC}"
cd ~/.
mv .spacemacs .spacemacs.old
mv .zshrc .zshrc.old
mv .vimrc .vimrc.old

# Install Oh my zsh - in case it isn't
if [ -d ~/.oh-my-zsh ]; then
    echo -e "${RED}Oh My Zsh is installed!${NC}"
else
    echo -e "${RED}Installing Oh My Zsh${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Zsh addons
echo -e "${RED}Installing some Zsh plugins${NC}"
# Install zsh autocomplete
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    echo -e "${RED}Zsh Autosuggestions already installed!"
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Install powerlevel9k
if [ -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    echo -e "${RED}powerlevel9k already installed!"
else
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

# Install Spacemacs
if [ -d ~/.emacs.d ]; then
    if [ -f ~/.emacs.d/spacemacs.mk ]; then
        echo -e "${RED}Spacemacs already installed!${NC}"
    else
        echo -e "${RED}Emacs Installed but no spacemacs, backing up emacs"
        mv ~/.emacs.d ~/.emacs.d.old
        git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
        cd ~/.emacs.d
        git checkout develop
        cd ~/.
    fi
else
    echo -e "${RED}Installing Spacemacs${NC}"
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    cd ~/.emacs.d
    git checkout develop
    cd ~/.
fi

# Obtain all dotfiles
echo -e "${RED}Retreiving Dots!${NC}"
rm -rf ~/dotfiles
cd ~/.
git clone https://github.com/JPyke3/dotfiles

# Move all dotfiles
echo -e "${RED}Moving Dots!${NC}"
for file in * ~/dotfiles/.*
do
    test -f "$file" && mv "$file" "$HOME"
done

# Make i3 dir
echo -e "${RED}Configuring i3${NC}"
mkdir ~/.config/i3 -p

# Move and backup i3 Config
if [ -f ~/.config/i3/config ]; then
    mv ~/.config/i3/config ~/.config/i3/config.old
fi
mv ~/dotfiles/.config/i3/config ~/.config/i3/config

# Make vim dir
echo -e "${RED}Configuring Vim${NC}"
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.old
fi
mkdir ~/.vim/undodir -p

# Vim Plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa
cd ~/.vim/plugged/YouCompleteMe
if [ -f /usr/bin/raspi-config ]; then
    echo -e "${RED}Raspberry Pi Detected!${NC}"
    YCM_CORES=1 python3 install.py --all
else
    python3 install.py --all
fi
cd ~/. 

# Clean Up
echo -e "${RED}Cleaning Up${NC}"
rm -rf ~/dotfiles

# New shell to get new configs
clear
neofetch
echo -e "${RED}Installation Successful${NC}"
exec /bin/zsh
