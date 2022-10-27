#! /usr/bin/env sh

sudo apt install apt-transport-https curl gnupg -y

sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo -y
sudo add-apt-repository ppa:apandada1/foliate -y

sudo apt update -y

sudo apt install tmux curl wget git neofetch htop mpv gnome-tweaks trash-cli flameshot ipython3 python3-pip tldr net-tools speedtest-cli neovim fd-find aria2 tree cowsay fzf clangd golang fonts-noto-mono ripgrep foliate ibus-bamboo unrar moreutils exa universal-ctags lua5.4 node-typescript bat python3-venv shfmt unzip cargo gem ruby-full build-essential zlib1g-dev php adb npm libsqlite3-dev kdenlive git-extras -y

snap install starship

curl -fsSL https://deno.land/install.sh | sh

npm config set prefix ~/.npm/

npm install --global prettier
npm install --global tinypng-cli
npm install --global browser-sync
npm install --global yarn
npm install --global neovim
npm install --global typescript

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

pip install --upgrade pylint
pip install --upgrade autopep8
pip install --upgrade pynvim

gem install neovim jekyll bundler
cargo install stylua

mkdir ~/app/
cd ~/app
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
cd -

# nvim setup
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

npm config set prefix ~/.npm/

cd ~/
git clone git@github.com:thuanOwa/dotfiles.git

mkdir ~/sync/
cd ~/sync/
git clone git@github.com:thuanOwa/ok.git
git clone git@github.com:thuanOwa/obs-studio.git

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -sf ~/sync/ok/.fonts ~/.fonts
cd ~/dotfiles/.fonts
fc-cache -v

ln -sf ~/sync/ok/.tinypng ~/.tinypng
ln -sf ~/dotfiles/bash/bashrc ~/.bashrc
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/ssh/config ~/.ssh/config
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/kitty/ ~/.config/
ln -sf ~/dotfiles/bat/ ~/.config/
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gh_config.yml ~/.config/gh/config.yml
ln -sf ~/dotfiles/git/lazygit_config.yml ~/.config/lazygit/config.yml
ln -sf ~/dotfiles/.selected_editor ~/.selected_editor
ln -sf ~/dotfiles/touchcursor ~/.config/
ln -sf ~/dotfiles/starship.toml ~/.config/
ln -sf ~/dotfiles/.ripgreprc ~/
ln -sf ~/dotfiles/input-remapper/ ~/.config/
ln -sf ~/sync/obs-studio/ ~/.config/
ln -sf ~/dotfiles/.ideavimrc ~/

cd /usr/share/applications/
sudo find -type l -delete
cd -
sudo ln -sf ~/dotfiles/applications/* /usr/share/applications/

mkdir ~/repos/
cd ~/repos/

gh repo list thuanOwa --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done

cd ~/repos/

gh repo list ongdev --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done

cd ~/repos/

gh repo list isekaiSystem --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done
