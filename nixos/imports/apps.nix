{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox 	# Main browser
    vscode 	# Code Editor
    
    # System 
    kdePackages.kpmcore   # Partition manager
    thunar     # File manager
    

    # Communication
    vesktop
    telegram-desktop

    # Gaminng 
    steam
    lutris
  ];

  programs.partition-manager.enable = true; 
  
  programs.steam.enable = true;
}