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

-- Workspace Rules
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Smart gaps: remove gaps when only one window is present
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
