# FEDORA AND GNOME DE SET-UP PROCESS


### 1. Fedora Minimal Install

- Create a partition automatically (custom, done)
- Fedora Everything – Minimal Install
- User Creation (Make this user administrator, Require a password to use this account)

### 2. Desktop Environment

Required package for gnome desktop: `sudo dnf install gdm gnome-shell alacritty firefox`

Enable login using graphical interface: `systemctl enable gdm`

Boot to graphical interface as default: `systemctl set-default graphical.target`

`reboot`

Xorg login

### 3. Software Installation

- **Telegram**
 
`sudo dnf upgrade --refresh -y`

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
```

`sudo dnf install telegram -y`

- **Other Stuff**

```
sudo dnf install nautilus celluloid flameshot rofi shotwell zathura zathura-pdf-mupdf anki libreoffice-writer zsh zsh-syntax-highlighting zsh-autosuggestions neovim vifm xclip fzf unzip wget git gh stow xmodmap gnome-tweaks gnome-extensions-app gnome-browser-connector xprop gnome-software
```

- **Flatpak**

https://flathub.org/apps/details/md.obsidian.Obsidian

https://flathub.org/apps/details/com.ticktick.TickTick

https://flathub.org/apps/details/com.github.finefindus.eyedropper

- **Greenclip**

`wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip`

`sudo mv greenclip /bin && cd /bin && chmod +x greenclip`

### 4. Place all the files

`rm ~/.config/vifm/vifmrc`

`cd ~/fedora-gnome && stow .`

`mkdir .cache/zsh && touch .cache/zsh/history .cache/greenclip.history`

### 5. Neovim

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

`PlugUpdate`

### 6. Firefox

Log in into Firefox and import 'Scroll Anywhere', 'Vimium' and 'Simple Translate' configs

### 7. Remove Rounded Corners

```
echo '/* UNITE windowDecorations */
@import url('/home/andrei/.local/share/gnome-shell/extensions/unite@hardpixel.eu/styles/gtk3/buttons-right/always.css');
/* windowDecorations UNITE */
decoration, window, window.background, window.titlebar, * {
border-radius: 0px;
}' >> ~/.config/gtk-3.0/gtk.css
```

### 8. Gnome settings

### **Settings:**

Bluetooth – off

Multitasking – Workspaces – Fixed number of workspaces (4)

Mouse & Touchpad – Touchpad – Tap to Click

Keyboard – Input Sources – English, Russian

Nautilus – Sort Folders Before Files

### **Gnome Shortcuts:**

Navigation:

- Move window to workspace 1 – Shift+Alt+A

- Move window to workspace 2 – Shift+Alt+S

- Move window to workspace 3 – Shift+Alt+D

- Move window to workspace 4 – Shift+Alt+F

- Switch to workspace 1 – Alt+A

- Switch to workspace 2 – Alt+S

- Switch to workspace 3 – Alt+D

- Switch to workspace 4 – Alt+F

- Switch windows – Alt+Esc

- Switch windows directly – Alt+Tab

Windows: 

- Close window – Alt+Q

- Hide window – Alt+J

### **Gnome Custom Shortcuts:**

KL1 (Alt+1)

`bash /home/andrei/.scripts/klayouts/us-ru.sh`

KL2 (Alt+2)

`bash /home/andrei/.scripts/klayouts/de-ru.sh`

KL3 (Alt+3)

`bash /home/andrei/.scripts/klayouts/es-ru.sh`

Clipboard (Alt+C)

`rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'`

Screenshot (Print)

`flameshot gui`

Terminal (Alt+Return)

`alacritty -e zsh`

Vifm (Alt+V)

`alacritty -e vifm /home/andrei`

*OR*

Export:

```
dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' > custom-shortcuts.conf
```

Import: `dconf load / < custom-shortcuts.conf`

### **Endash:**

/usr/share/X11/xkb/symbols/pc

Menu –> endash

:W (to write file with sudo privileges)

### **Gnome Tweaks:**

Keyboard & Mouse – Caps Lock behaviour – Swap Esc and Caps Lock

Keyboard & Mouse – Switching to another layout – Right Alt

Windows – Center New Windows

### **Gnome Extensions:**

**Unite:**

- General (All disabled, Always, Always, Never, Never, Right)

- Appearance (All disabled)

**Tiling Assistant:**

General:

- Gaps: 8, 8.

- Dynamic Keybinding Behaviour – Window Focus

Keybindings:

- Toggle Maximization – Alt+K

- Move Window to Center – Alt+G

- Tile to top – Alt+Up

- Tile to bottom – Alt+Down

- Tile to left – Alt+H

- Tile to right – Alt+L

- Corner Tiling – All disabled
