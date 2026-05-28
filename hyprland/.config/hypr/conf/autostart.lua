-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
	hl.exec_cmd("bash -c 'sleep 1 && hyprpaper'")
	hl.exec_cmd("mako")
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
	-- hl.exec_cmd("~/scripts/spotify_notify.sh")  -- notify now playing script
end)
