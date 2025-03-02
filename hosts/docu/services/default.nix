{
  imports = [
    ../../common/optional/nginx.nix
    ../../common/optional/acme.nix
    ../../common/optional/podman.nix

    ./bookstack.nix
  ];
}
