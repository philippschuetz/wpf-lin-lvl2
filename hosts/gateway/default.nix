{
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/philipp
  ];

  networking = {
    hostName = "gateway.FI-X-yz.oszimt.lan";
    useDHCP = true;
    firewall = {
      enable = true;
    };
  };

  system.stateVersion = "24.05";
}
