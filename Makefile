all: copy-config backup-config
copy-config:
	@echo "Copying config files..."
	@cp -v ~/.zshrc ./zsh/
	@cp -v ~/.vimrc ./vim/
	@cp -v ~/.tmux.conf ./tmux/
	@cp -v ~/.robomongorc.js ./robo3t/
	@cp -v ~/.gitconfig ./git/
	@cp -v ~/.gtkrc-2.0 ./gtk2/
	@cp -v ~/.xinitrc ./xinit/
	@cp -v ~/.profile ./profile/
	@cp -v ~/.config/starship.toml ./starship/
	@cp -vr ~/.config/bspwm .
	@cp -vr ~/.config/dunst .
	@cp -vr ~/.config/kitty .
	@cp -vr ~/.config/nvim .
	@cp -vr ~/.config/sxhkd .
	@cp -vr ~/.config/picom .
	@cp -vr ~/.config/polybar .
	@cp -vr ~/.config/rofi .
	@cp -vr ~/.config/tilix .
	@cp -vr ~/.config/gtk-3.0 .
	@cp -vr ~/.config/pcmanfm .
	@cp -v ~/.oh-my-zsh/custom/aliases.zsh oh-my-zsh/
	@cp -v /etc/X11/xorg.conf.d/40-libinput.conf ./X11/xorg.conf.d/
	@cp -v /etc/lightdm/{lightdm.conf,slick-greeter.conf,display_setup.sh} ./lightdm/
	@cp -vr ~/.local/share/fonts local/share/
	@cp -v /etc/nsswitch.conf printer/nss-mdns/
	@code --list-extensions | sed -e 's/^/code --install-extension /' > ./vscode/my_vscode_extensions.sh

aliases-config:
	@echo "Deploying oh-my-zsh aliases files..."
	@echo "OMZ should be previously installed at ~/.oh-my-zsh/custom"
	@echo "Press ENTER for continue"
	@read
	@cp -vr oh-my-zsh/aliases.zsh ~/.oh-my-zsh/custom/

bspwm-config:
	@echo "Deploying bspwm config files..."
	@mkdir -pv ~/.config/bspwm
	@cp -vr bspwm/ ~/.config/

dotfiles-config:
	@echo "Deploying dotfiles..."
	@cp -v ./zsh/.zshrc ~
	@cp -v ./vim/.vimrc ~
	@cp -v ./tmux/.tmux.conf ~
	@cp -v ./robo3t/.robomongorc.js ~
	@cp -v ./git/.gitconfig ~
	@cp -v ./gtk2/.gtkrc-2.0 ~
	@cp -v ./xinit/.xinitrc ~
	@cp -v ./profile/.profile ~

dunst-config:
	@echo "Deploying dunst config files..."
	@mkdir -pv ~/.config/dunst
	@cp -vr dunst/ ~/.config/

fonts-config:
	@echo "Deploying font files..."
	@mkdir -pv ~/.local/share/fonts
	@cp -vr local/share/fonts ~/.local/share/

grub-config:
	@echo "Updating grub config..."
	sudo cp -vi grub/grub /etc/default/grub
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	sudo grub-mkconfig -o /boot/efi/EFI/arch/grub.cfg

gtk-3.0-config:
	@echo "Deploying gtk3 files..."
	@mkdir -pv ~/.config/gtk-3.0
	@cp -vr gtk-3.0/ ~/.config/

kitty-config:
	@echo "Deploying kitty files..."
	@mkdir -pv ~/.config/kitty
	@cp -vr kitty/ ~/.config/

lightdm-config:
	@echo "Deploying window manager files...(requires sudo)"
	sudo cp -v lightdm/lightdm.conf /etc/lightdm/
	sudo cp -v lightdm/slick-greeter.conf /etc/lightdm/
	@read

nvidia-config:
	@echo "Adding pacman hook to include driver and drm modeset every time the kernel updates"
	sudo mkdir -pv /etc/pacman.d/hooks
	sudo cp nvidia/nvidia.hook /etc/pacman.d/hooks/nvidia.hook
	@echo "If Offloading Graphic Display NVIDIA -> Intel Display execute"
	echo "sudo cp ./X11/xorg.conf /etc/X11/"
	@echo "If Prime Render, use Intel mainly and execute prime-run command for NVIDIA"
	echo "sudo cp ./X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/"

nvim-config:
	@echo "Setting Neovim config...(requires vim-plug package)"
	@mkdir -pv ~/.config/nvim
	@cp -vr nvim/ ~/.config/
	@nvim +PlugInstall

pcmanfm-config:
	@echo "Deploying PCManFM config files..."
	@mkdir -pv ~/.config/pcmanfm
	@cp -vr pcmanfm/ ~/.config/

picom-config:
	@echo "Deploying picom config files..."
	@mkdir -pv ~/.config/picom
	@cp -vr picom/ ~/.config/

polybar-config:
	@echo "Deploying polybar config files..."
	@mkdir -pv ~/.config/polybar
	@cp -vr polybar/ ~/.config/

printer-config:
	@echo "Deploying printer config files...(requires sudo)"
	sudo cp -v printer/nss-mdns/nsswitch.conf /etc/
	sudo cp -v cups/cups-files.conf /etc/cups/
	sudo chown root:cups /etc/cups/cups-files.conf
	@read

rofi-config:
	@echo "Deploying rofi config files..."
	@mkdir -pv ~/.config/rofi
	@cp -vr rofi/ ~/.config/

starship-config:
	@echo "Installing/updating starship..."
	@curl -fsSL "https://starship.rs/install.sh" > ./install.sh
	@chmod 755 ./install.sh
	@./install.sh
	@cp -v ./starship/starship.toml ~/.config/starship.toml

sxhkd-config:
	@echo "Deploying sxhkd config files..."
	@mkdir -pv ~/.config/sxhkd
	@cp -vr sxhkd/ ~/.config/

tilix-config:
	@echo "Deploying tilix config files..."
	@mkdir -pv ~/.config/tilix
	@cp -vr tilix/ ~/.config/

vim-theme-config:
	@echo "Deploying vim config files..."
	@mkdir -p ~/.vim/pack/themes/start
	@cd ~/.vim/pack/themes/start
	@git clone https://github.com/dracula/vim.git dracula

vscode-config:
	@echo "installing VSCode extensions..."
	@./vscode/my_vscode_extensions.sh

xorg-config:
	@echo "Deploying XOrg config files...(requires sudo)"
	sudo cp -v X11/xorg.conf.d/* /etc/X11/xorg.conf.d/
	@read

backup-repo:
	@echo "Backing files..."
	@git add -u .;
	@git commit -m "New backup `date +'%Y-%m-%d %H:%M'`";
	@git push origin main;

