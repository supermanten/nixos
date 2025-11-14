{ pkgs, ... }:

{
  home.username = "rio";
  home.homeDirectory = "/home/rio";
  home.stateVersion = "25.05";
  programs.nushell = { enable = true; };

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    rofi
    git
    yazi
    wl-clipboard
    cliphist
    fastfetch
    foot
    go
    cargo
    unzip
    fd
  ];

}
