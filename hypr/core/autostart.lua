local v = require("core.variables")



hl.on("hyprland.start", function () 

  -- Waybar
  hl.exec_cmd("~/.config/hypr/scripts/launch_waybar.sh")
  
  -- Hyprpaper (wallpaper system)
  hl.exec_cmd("~/.config/hypr/scripts/launch_hyprpaper.sh")
end)