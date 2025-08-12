#!/bin/sh

# install yay
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin && makepkg -si --noconfirm && cd .. && rm -rf yay-bin

# install packages
yay -S --needed --noconfirm zsh waybar alacritty hellwal neovim swww python-pywalfox firefox nautilus

# install oh-my-zsh (unattended, keep .zshrc)
RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# pull down your dotfiles repo (if not already cloned)
if [ ! -d "$HOME/.config" ] || [ ! -f "$HOME/.zshrc" ]; then
  git clone https://github.com/josiahmattern/dots.git ~/dotfiles-tmp
  cd ~/dotfiles-tmp
  cp -r scripts/ ~/
  cp -r .config/ ~/
  cp .zshrc ~/
  cd ..
  rm -rf ~/dotfiles-tmp
else
  echo "Configs already exist, skipping copy."
fi

# make zsh default shell
chsh -s "$(command -v zsh)"

echo "✅ Install complete! Log out/in to start using zsh."
