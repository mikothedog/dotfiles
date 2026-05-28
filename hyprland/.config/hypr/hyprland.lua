---@diagnostic disable: undefined-global

-- Hyprland Lua config
-- Converted from hyprland.conf per wiki conventions (v0.55+)
-- See https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "HDMI-A-2",
	mode = "3840x2160@60",
	position = "auto",
	scale = 2,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local systemMonitor = terminal .. " -e btop"
local fileManager = terminal .. " -e /sbin/yazi"
local musicPlayer = "spotify-launcher"
local menu = "rofi -show drun"
local toggleMenu = "~/.config/rofi/scripts/rofi-toggle.sh"
local editor = terminal .. " -e /sbin/nvim"
local browser = "zen-browser"
local bluetui = terminal .. " -e /sbin/bluetui"
local impala = terminal .. " -e /sbin/impala"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar & hyprpaper")
	hl.exec_cmd("mako")
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
	-- hl.exec_cmd("~/scripts/spotify_notify.sh")  -- notify now playing script
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- NOTE: If using uwsm, put env vars in ~/.config/uwsm/env or ~/.config/uwsm/env-hyprland instead
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
-- Currently integrated GPU, 'iGPU' is disabled in BIOS
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Note: permission changes require a Hyprland restart

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 15,

		border_size = 2,

		-- Colors: hex strings "rgb(rrggbb)" or "rgba(rrggbbaa)"
		-- Original values: rgb(224,218,220) -> rgb(e0dadc), rgb(240,211,223) -> rgb(f0d3df)
		col = {
			active_border = { colors = { "rgb(e0dadc)", "rgb(f0d3df)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 0,

		active_opacity = 1.0,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

--------------------
---- ANIMATIONS ----
--------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

------------------------
---- WORKSPACE RULES ----
------------------------

-- Remove gaps/borders when only one window is present
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
hl.workspace_rule({ workspace = "w[tv1]", no_border = true, gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", no_border = true, gaps_out = 0, gaps_in = 0 })

-------------------
---- LAYOUTS ----
-------------------

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
-- hl.config({
--     dwindle = {
--         pseudotile     = true,  -- Master switch for pseudotiling. Bound to SUPER + P below
--         preserve_split = true,  -- You probably want this
--     },
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
	master = {
		new_status = "master",
	},
})

---------------
---- MISC ----
---------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background :(
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us, il",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
-- Key syntax: "MOD + MOD + KEY"
local mainMod = "SUPER"

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(musicPlayer))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(toggleMenu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("hyprctl dispatch exit"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(bluetui))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(impala))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill waybar && hyprctl dispatch exec waybar"))
-- hl.bind(mainMod .. " + SHIFT + D", hl.dsp.layout("togglesplit"))  -- dwindle

hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(systemMonitor))

-- Screenshot: save to ~/Pictures/Screenshots/ with grim + slurp, also copy to clipboard
hl.bind(
	mainMod .. " + SHIFT + P",
	hl.dsp.exec_cmd(
		'grim -g "$(slurp -d)" - | tee ~/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png | wl-copy && notify-send -u normal "Saved & copied"'
	)
)

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Emojis
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))

-- Move focus with mainMod + HJKL
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces and move windows: mainMod + [0-9] / mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- key 0 maps to workspace 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume keys (locked = works on lock screen, repeating = fires while held)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(
		"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+ && notify-send -h string:x-canonical-private-synchronous:sys-notify \"Volume: $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')%\""
	),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(
		"wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- && notify-send -h string:x-canonical-private-synchronous:sys-notify \"Volume: $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')%\""
	),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/scripts/toggle-mute.sh"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

-- Brightness keys (locked + repeating)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%-"), { locked = true, repeating = true })

-- Media keys (locked only)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
hl.window_rule({
	name = "ghostty-opacity",
	match = { class = "com.mitchellh.ghostty" },
	opacity = "0.96 0.96", -- active inactive
})

-- XWayland scaling
hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})
