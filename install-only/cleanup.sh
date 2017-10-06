#!/usr/bin/env bash

# remove nopassword stuff & disable unwanted services
rm -f /etc/sudoers.d/g_wheel
rm /etc/mkinitcpio-archiso.conf
rm /root/{.automated_script.sh,.zlogin}
rm -f /etc/polkit-1/rules.d/49-nopasswd_global.rules
rm -rf /etc/systemd/system/{getty@tty1.service.d,default.target}


# unsure if these are needed
#rm etc/systemd/system/{pacman-init.service,etc-pacman.d-gnupg.mount}
#rm -r /etc/initcpio
#systemctl disable pacman-init.service

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
sed -i 's/Install Archlabs/Lock Screen/g' /etc/skel/.config/openbox/menu.xml
sed -i 's/install-al/i3lock-fancy -p/g' /etc/skel/.config/openbox/menu.xml

# enable al-hello after install
sed -i 's/#sleep 5; termite/sleep 5; termite/g' /etc/skel/.config/openbox/autostart

# fix boot messages
sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ c\
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nowatchdog systemd.legacy_systemd_cgroup_controller=true"' /etc/default/grub

# remove this script
rm /usr/bin/cleanup.sh
