-- Apply GTK dark theme + icons
local v = require("core.variables")

local home = os.getenv("HOME")

-- Write a file, creating its parent directory first
local function write_file(dir, name, lines)
    os.execute("mkdir -p '" .. dir .. "'")
    local f = io.open(dir .. "/" .. name, "w")
    if not f then return end
    f:write(table.concat(lines, "\n") .. "\n")
    f:close()
end

hl.on("hyprland.start", function()
    -- GTK3 + GTK4 (same content)
    local gtk = {
        "[Settings]",
        "gtk-theme-name=Adwaita-dark",
        "gtk-application-prefer-dark-theme=true",
        "gtk-icon-theme-name=Papirus-Dark",
    }
    write_file(home .. "/.config/gtk-3.0", "settings.ini", gtk)
    write_file(home .. "/.config/gtk-4.0", "settings.ini", gtk)

    -- Kvantum theme selection
    write_file(home .. "/.config/Kvantum", "kvantum.kvconfig", {
        "[General]",
        "theme=KvGnomeDark",
    })

    -- qt5ct/qt6ct: tell them to use Kvantum (same content)
    local qt = {
        "[Appearance]",
        "style=kvantum",
    }
    write_file(home .. "/.config/qt5ct", "qt5ct.conf", qt)
    write_file(home .. "/.config/qt6ct", "qt6ct.conf", qt)
end)