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
  ];
}