{
  imports = [
    ./gc.nix
    ./locale.nix
    ./nix-ld.nix
    ./sops.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true; # move to flake.nix?
}
