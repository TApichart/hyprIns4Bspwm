#!/usr/bin/bash

uSRCFG=$HOME/.config
hYPRFILE=$hYPRFILE

# sudo pacman -S sddm hyprland waybar dolphin hyprpaper kitty mate-terminal rofi picom
sudo pacman -S hyprland waybar dolphin hyprpaper kitty

mkdir -p $uSRCFG/hypr
cp /usr/share/hyprland/hyprland.conf $hYPRFILE
# cp /etc/xdg/picom.conf $uSRCFG/picom
sed -i 's/^autogenerated/#autogenerated/g' $hYPRFILE
sed -i 's/terminal = kitty/terminal = mate-terminal --hide-menubar/g;s/wofi --show/rofi -show/g' $hYPRFILE
sed -i '/^# exec-once = \$terminal/c\\exec-once = picom --config ~/.config/picom/picom.conf' $hYPRFILE
sed -i '/^# exec-once = waybar/c\\exec-once = waybar & hyprpaper' $hYPRFILE
sed -i 's/gaps_in = 5/gaps_in = 4/g;s/gaps_out = 20/gaps_out = 6/g;s/border_size = 2/border_size = 1/g;s/rounding = 10/rounding = 7/g' $hYPRFILE
sed -i 's/disable_hyprland_logo = false/disable_hyprland_logo = true/g' $hYPRFILE
sed -i 's/\$mainMod, Q/\$mainMod, Return/g' $hYPRFILE
sed -i 's/\$mainMod, M, exit/\$mainMod, Q, exit/g' $hYPRFILE
sed -i 's/\$mainMod, C, killactive/\$mainMod SHIFT, X, killactive/g' $hYPRFILE
