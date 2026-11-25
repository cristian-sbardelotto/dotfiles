---@module 'hl'

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd(
    "sleep 0.5 && awww img ~/Pictures/Wallpapers/47.jpg --transition-type grow --transition-duration 1 --transition-fps 60")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("dbus-update-activation-environment --systemd GTK_IM_MODULE QT_IM_MODULE XMODIFIERS")
    hl.exec_cmd("hyprctl setcursor capitaine-cursors 20")
    hl.exec_cmd("/usr/libexec/polkit-mate-authentication-agent-1")
end)
