-- Window Rules
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
	name = "ghostty-opacity",
	match = { class = "com.mitchellh.ghostty" },
	opacity = "0.96 0.96", -- active inactive
})

-- No border/rounding for single-window workspaces
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "yazi-float",
	match = {
		class = "com.mitchellh.ghostty",
		initial_title = "Yazi",
	},
	float = true,
	size = { "monitor_w*0.6", "monitor_h*0.6" },
	center = true,
	border_size = 5,
	rounding = 10,
	rounding_power = 1.75,
})
hl.window_rule({
	match = { class = "Nsxiv" },
	float = true,
	maximize = true,
	center = true,
})
hl.window_rule({
	name = "carla-float",
	match = {
		class = "carla",
	},
	float = true,
	size = { "monitor_w*0.8", "monitor_h*0.8" },
	center = true,
	border_size = 5,
	rounding = 10,
	rounding_power = 1.75,
})
hl.window_rule({
	name = "gxtuner-float",
	match = {
		initial_title = "^GxTuner \\(GUI\\)$",
		xwayland = true,
	},
	float = true,
	size = { "monitor_w*0.2", "monitor_h*0.1.5" },
	center = true,
	border_size = 5,
	rounding = 10,
	rounding_power = 1.75,
})
hl.window_rule({
	name = "neuralampmodeler-float",
	match = {
		initial_title = "^NeuralAmpModeler \\(GUI\\)$",
		xwayland = true,
	},
	float = true,
	size = { 665, 462 },
	border_size = 5,
	rounding = 10,
	rounding_power = 1.75,
})

-- Workspace Rules
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Smart gaps: remove gaps when only one window is present
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
