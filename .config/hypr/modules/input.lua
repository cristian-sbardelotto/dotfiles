---@module 'hl'

-- https://wiki.hypr.land/Configuring/Variables/#input
hl.config({
    input = {
        kb_layout = "br",
        kb_variant = "",
        follow_mouse = 1,
        sensitivity = 0.5, -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "flat",
        touchpad = {
            natural_scroll = true,
        },
    },
    cursor = {
        zoom_factor = 1.0,
    },
})

-- See https://wiki.hypr.land/Configuring/Gestures
hl.gesture({
    ["fingers"] = 3,
    ["direction"] = "horizontal",
    ["action"] = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more
hl.device({
    name = "usb-gaming-mouse",
    sensitivity = 0.3,
})
