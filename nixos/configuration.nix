# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  # imports
  imports =
    [
      ./hardware-configuration.nix # Automatic hardware configuration 
      ./imports/terminal.nix       # Terminal And Shell configuration
      ./imports/window_manager.nix # Window manager configuration and packages 
    ];

  # ---------- Boot ----------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # ---------- Networking ----------
  networking.hostName = "arretee_nixos";
  networking.networkmanager.enable = true;

  # ---------- Time ----------
  time.timeZone = "Asia/Jerusalem";

  i18n.defaultLocale = "en_US.UTF-8";


  # ---------- Keyboard layout ----------
  console.useXkbConfig = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # ---------- Users settings ----------
  users.users."arretee" = {
    isNormalUser = true;
    description = "arretee";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };


  # ------------ Graphics card -----------------
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaSettings = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
  
  boot.kernelParams = [ "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];

  # ---------------- Audio ------------------
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
 

  # --------------- Fonts -----------------
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];  


  # --------------- Packages ---------------
  environment.systemPackages = with pkgs; [
    # Apps
    firefox 	# Main browser
    kdePackages.dolphin     # File manager
    vscode 	# Code Editor
    
    # Communication
    vesktop
    telegram-desktop
    
 
 ];
 

  # -------------- Boot loader ------------
  boot.loader.systemd-boot.configurationLimit = 5; 

  # -------------- Not changeble settings -------------
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05"; 
}
