---@module 'hl'

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules
-- Example windowrule

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name           = "suppressevent_maximi_8",
    match          = {
        class = ".*",
    },
    suppress_event = "maximize",
})

-- Ignore minimize requests from apps
hl.window_rule({
    name           = "suppressevent_minimi_11",
    match          = {
        class = ".*",
    },
    suppress_event = "minimize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name     = "nofocus_14",
    match    = {
        class = "^$",
        title = "^$",
        xwayland = 1,
        float = 1,
        fullscreen = 0,
        pin = 0,
    },
    no_focus = true,
})

-- File Picker floating mode
hl.window_rule({
    name  = "float_17",
    match = {
        class = "^(xdg-desktop-portal-gtk)$",
    },
    float = true,
})
hl.window_rule({
    name   = "center_18",
    match  = {
        class = "^(xdg-desktop-portal-gtk)$",
    },
    center = true,
})
hl.window_rule({
    name  = "size_900_700_19",
    match = {
        class = "^(xdg-desktop-portal-gtk)$",
    },
    size  = { 900, 700 },
})


-- WORKSPACES

-- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        -- pseudotile = true,
        preserve_split = true,
        -- You probably want this
        force_split = 2,
    },
})

-- See https://wiki.hypr.land/Configuring/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})
