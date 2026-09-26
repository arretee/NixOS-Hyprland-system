{ config, pkgs, ... }:

{
  # Configure shell
  users.defaultUserShell = pkgs.zsh; # Main shell -> ZSH

  # zsh configuration
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };


  # Packages 
  environment.systemPackages = with pkgs; [
    kitty # Main terminal

    # ------------------ settings tools ------------------
    xrandr  # Monitors settigns tool


    # ------------------ Monitoring / visual tools ------------------
    htop    # Htop for resources monitoring


    tree    
    eza     # Modern ls
    bat     # Cat replacment with synatx highliting

    # ------------------ Commands ------------------
    fd      # find replacment


    zip unzip p7zip unrar


    # ------------------ dev tools ------------------
    git 
    vim


    python3
    python314Packages.pip

    gcc
    cmake
  ];


}