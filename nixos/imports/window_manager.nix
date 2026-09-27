{ config, pkgs, ... }:


{
  # Hyprland - Window manager
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Login Screen 
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
      user = "greeter"; 
    };
  };


  # packages for hyprland
  environment.systemPackages = with pkgs; [
    # Hyprland essentials
    wofi 	# App launcher
    waybar	# Status bar
    mako 	# Notifications
    hyprpaper  	# Wallpaper
    grim 	# Screenshots
    slurp 	# Selecet screen area
    wl-clipboard	# Clipboard tools



    # GTK Themes 
    gnome-themes-extra
    papirus-icon-theme        
    nwg-look                 
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];


  # Themes
  programs.dconf.enable = true;   # needed for gsettings/dconf to work at all
}