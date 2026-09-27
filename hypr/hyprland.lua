require("core.autostart")
require("core.monitors")
require("core.binds")
require("core.input")
require("core.rule")
require("core.appearance")
require("core.env")

require("apps.theme")



-- Hyprland build in wallpapers
hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})





