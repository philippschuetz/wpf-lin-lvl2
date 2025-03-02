{pkgs ? import <nixpkgs> {}, ...}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    EDITOR = "vim";
    nativeBuildInputs = with pkgs; [
      nix
      home-manager
      git
      vim
      tmux

      sops
      ssh-to-age
      gnupg
      age
      apacheHttpd
    ];
  };
}
