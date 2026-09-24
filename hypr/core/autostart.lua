local v = require("core.variables")

hl.on("hyprland.start", function () 
  hl.exec_cmd(v.waybar)
end)