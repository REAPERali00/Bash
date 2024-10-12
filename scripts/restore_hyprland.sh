
#!/bin/bash

# Restore Arch Linux Hyprland Environment

# Set backup directory
BACKUP_DIR=~/D/arch_backup/hyprland-backup

echo "Starting restoration process..."

# 1. Extract the compressed backup
tar -xvzf ~/D/arch_backup/hyprland-backup.tar.gz -C ~/

# 2. Restore Home Configuration Files
rsync -a --progress $BACKUP_DIR/.config ~/
rsync -a --progress $BACKUP_DIR/.local ~/
rsync -a --progress $BACKUP_DIR/.bashrc ~/
rsync -a --progress $BACKUP_DIR/.zshrc ~/
rsync -a --progress $BACKUP_DIR/.profile ~/

# 3. Restore System Configuration Files
sudo rsync -a --progress $BACKUP_DIR/system-etc/ /etc

# 4. Restore Personal Files (Documents and Downloads)
rsync -a --progress $BACKUP_DIR/Documents ~/Documents/
rsync -a --progress $BACKUP_DIR/Downloads ~/Downloads/

# 5. Restore Installed Packages
sudo pacman -S --needed - < $BACKUP_DIR/pkglist.txt
yay -S --needed - < $BACKUP_DIR/aurpkglist.txt

echo "Restoration completed."
