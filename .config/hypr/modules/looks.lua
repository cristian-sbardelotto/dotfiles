---@module 'hl'

-- Refer to https://wiki.hypr.land/Configuring/Variables/
-- https://wiki.hypr.land/Configuring/Variables/#general
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 15,
        border_size = 1,
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,
        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
        col = {
            -- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
            active_border = "rgba(d9d9d9ff)",
            inactive_border = "rgba(595959aa)",
            -- active_border = rgba(ff0000ff)
            -- inactive_border = rgba(5c3a3aff)
        },
    },
})

-- https://wiki.hypr.land/Configuring/Variables/#decoration
hl.config({
    decoration = {
        wobble = {
            enabled = true,
            mesh = 32,            -- Amount of wobble mesh vertices per edge [2 - 32]
            stiffness = 200,      -- Spring stiffness for wobble deformation [0.0001 - 1000]
            damping = 12,         -- Spring damping for wobble deformation [0 - 1000]
            mass = 1,             -- Spring mass for wobble deformation [0.0001 - 1000]
            intensity = 0.5,      -- Wobble deformation impulse multiplier [0 - 2]
            value_epsilon = 0.25, -- Position epsilon below which wobble is considered stable [0 - 100]
            velocity_epsilon = 2, -- Velocity epsilon below which wobble is considered stable [0 - 1000]
        },
        -- rounding = 4,
        -- rounding = 20,
        rounding = 0,
        rounding_power = 3,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 6,
            passes = 2,
            vibrancy = 0.1696,
        },
    },
})
