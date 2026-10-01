{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox 	# Main browser
    vscode 	# Code Editor
    
    # Communication
    vesktop
    telegram-desktop

    # Gaminng 
    steam
    lutris
  ]
}