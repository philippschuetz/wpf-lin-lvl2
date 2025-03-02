{pkgs, ...}: {
  virtualisation = {
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerSocket.enable = true;
      dockerCompat = true;
      autoPrune = {
        enable = true;
        flags = [];
      };
    };
  };

  environment.systemPackages = [pkgs.podman-compose];
}
