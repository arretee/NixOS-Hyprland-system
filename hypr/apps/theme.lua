-- Apply GTK dark theme + icons
local v = require("core.variables")


hl.on("hyprland.start", function () 
    -- GTK3
        hl.exec_cmd([[mkdir -p ~/.config/gtk-3.0 && cat > ~/.config/gtk-3.0/settings.ini << 'EOF'
                    [Settings]
                    gtk-theme-name=Adwaita-dark
                    gtk-application-prefer-dark-theme=true
                    gtk-icon-theme-name=Papirus-Dark
                    EOF]])

        -- GTK4 (same content)
        hl.exec_cmd([[mkdir -p ~/.config/gtk-4.0 && cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini]])

        -- Kvantum theme selection
        hl.exec_cmd([[mkdir -p ~/.config/Kvantum && cat > ~/.config/Kvantum/kvantum.kvconfig << 'EOF'
                    [General]
                    theme=KvGnomeDark
                    EOF]])

        -- qt5ct/qt6ct: tell them to use Kvantum
        hl.exec_cmd([[mkdir -p ~/.config/qt5ct && cat > ~/.config/qt5ct/qt5ct.conf << 'EOF'
                    [Appearance]
                    style=kvantum
                    EOF]])
        
        hl.exec_cmd([[mkdir -p ~/.config/qt6ct && cp ~/.config/qt5ct/qt5ct.conf ~/.config/qt6ct/qt6ct.conf]])

end)