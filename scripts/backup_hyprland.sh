#!/bin/bash

# Backup Arch Linux Hyprland Environment

# Set backup directory
BACKUP_DIR=~/D/arch_backup/hyprland-backup

# Create backup directories if they don't exist
mkdir -p $BACKUP_DIR

echo "Starting backup process..."

# 1. Backup Home Configuration Files
rsync -a --progress ~/.config $BACKUP_DIR/
rsync -a --progress --exclude=".local/share/Steam" ~/.local $BACKUP_DIR/
rsync -a --progress ~/.bashrc ~/.zshrc ~/.profile $BACKUP_DIR/

# 2. Backup System Configuration Files
sudo rsync -a --progress /etc $BACKUP_DIR/system-etc/

# 3. Backup Installed Packages List
pacman -Qqe >$BACKUP_DIR/pkglist.txt
yay -Qqe >$BACKUP_DIR/aurpkglist.txt

# 4. Backup Bootloader Configuration (if needed)
sudo rsync -a --progress /boot $BACKUP_DIR/boot-backup/

# 5. Backup Hyprland Sessions (if any scripts exist)
rsync -a --progress ~/scripts $BACKUP_DIR/scripts/

# 6. Backup Additional Important Directories (if needed)
rsync -a --progress ~/.local/bin $BACKUP_DIR/local-bin-backup/

# 7. Backup Personal Files (Documents and Downloads)
rsync -a --progress ~/Documents $BACKUP_DIR/Documents/
rsync -a --progress ~/Downloads $BACKUP_DIR/Downloads/

# 8. Compress Backup Folder
tar -cvzf ~/D/arch_backup/hyprland-backup.tar.gz -C ~/D/arch_backup hyprland-backup

echo "Backup completed and compressed to ~/D/arch_backup/hyprland-backup.tar.gz"
