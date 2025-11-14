{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";
  
  services.xserver.windowManager.qtile.enable = true;

  services.displayManager.ly.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.rio = {
     isNormalUser = true;
     shell = pkgs.nushell;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     nushell
   ];

   programs.firefox.enable = true;

   fonts.packages = with pkgs;[
      nerd-fonts.jetbrains-mono 
  ];

   nix.settings.experimental-features = ["nix-command" "flakes"];


  system.stateVersion = "25.05"; # Did you read the comment?

}

