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
      ./imports/apps.nix           # apps for configuration -> browser, communication and more
      ./imports/graphics.nix       # graphics configuration
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
    thunar     # File manager
 ];
 

  # -------------- Boot loader ------------
  boot.loader.systemd-boot.configurationLimit = 5; 

  # -------------- Not changeble settings -------------
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05"; 
}
