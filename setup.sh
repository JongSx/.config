# !/bin/bash

proxy=${1-}
args=("$@")

function setup_mirrors() {
    sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
    sudo cp ${PWD}/pacman/mirrorlist /etc/pacman.d/mirrorlist
}

function install_staff() {
    sudo pacman -Syyu
    sudo pacman -S archlinuxcn-keyring yay zsh git vim wget
}

function setup_zsh() {
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # clone plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
      ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
    # copy .zshrc
    cp ~/.zshrc ~/.zshrc.bak
    cp ${PWD}/.zshrc ~/.zshrc
    source ~/.zshrc
}

function main() {
    setup_mirrors
    echo "[*] Setting Mirrors Done."
    install_staff
    echo "[*] Installed."
    setup_zsh
    echo "[*] Ohmyzsh Set Done."
}

main($@)