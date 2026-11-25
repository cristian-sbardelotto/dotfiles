---@module 'hl'

-- https://wiki.hypr.land/Configuring/

--###############
--## MONITORS ###
--###############
require("modules.monitors")

--##################
--## MY PROGRAMS ###
--##################
require("modules.programs")

--################
--## AUTOSTART ###
--################
require("modules.autostart")

--############################
--## ENVIRONMENT VARIABLES ###
--############################
require("modules.env-variables")

--##################
--## PERMISSIONS ###
--##################
require("modules.permissions")

--####################
--## LOOK AND FEEL ###
--####################
require("modules.looks")

--#################
--## ANIMATIONS ###
--#################
require("modules.animations")

--############
--## INPUT ###
--############
require("modules.input")

--##################
--## KEYBINDINGS ###
--##################
require("modules.keybinds")

--#############################
--## WINDOWS AND WORKSPACES ###
--#############################
require("modules.window-rules")

--#############################
--########## EXTRA ############
--#############################
hl.config({
    debug = {
        disable_logs = false,
    },
})
