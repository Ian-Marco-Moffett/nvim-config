sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


if [ -d "$HOME/.config/nvim" ]; then
  echo "Backing up existing nvim config.."
  mv $HOME/.config/nvim ~/nvim-backup
fi

git clone https://github.com/Ian-Marco-Moffett/nvim-config $HOME/.config/nvim
nvim +PlugInstall
