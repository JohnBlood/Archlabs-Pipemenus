#!/usr/bin/env bash


# bulk (best not to touch these unless you are certain)
rm -f /etc/sudoers.d/g_wheel
rm -f /etc/polkit-1/rules.d/49-nopasswd_global.rules
rm -rf /etc/systemd/system/{,pacman-init.service,etc-pacman.d-gnupg.mount,getty@tty1.service.d,default.target}
#choose-mirror.service  choose-mirror.service
#rm /etc/systemd/scripts/choose-mirror
systemctl disable pacman-init.service
rm /root/{.automated_script.sh,.zlogin}
rm /etc/mkinitcpio-archiso.conf
rm -r /etc/initcpio


# remove installers
rm -rf /etc/calamares
rm -rf /usr/lib/calamares
rm -rf /abif-master

# remove unwanted scripts & .desktop files
rm /usr/share/applications/qv412.desktop
rm /usr/share/applications/calamares.desktop
rm /usr/bin/install-al

# touch up
sed -i 's/Name=File Manager/Name=Thunar Settings/g' /usr/share/applications/thunar-settings.desktop
sed -i '183,187d' /etc/skel/.config/openbox/menu.xml
# sed -i '6d' /etc/environment

# enable al-hello after install
sed -i 's/#sleep 3; termite/sleep 3; termite/g' /etc/skel/.config/openbox/autostart
#sed -i '33d' /etc/skel/.config/openbox/autostart

# fix boot messages
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet nowatchdog systemd.legacy_systemd_cgroup_controller=true"/g' /etc/default/grub

# remove this script
rm /usr/bin/cleanup.sh
