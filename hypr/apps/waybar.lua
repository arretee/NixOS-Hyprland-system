local v = require("core.variables")



hl.on("hyprland.start", function () 
  hl.exec_cmd("~/.config/hypr/scripts/launch_waybar.sh")
end)