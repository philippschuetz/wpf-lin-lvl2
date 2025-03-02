{
  imports = [
    ./hardware-configuration.nix
    ./services
    ../common/global
    ../common/users/philipp
    ../common/optional/ssh.nix
  ];

  networking = {
    hostName = "docu.FI-X-yz.oszimt.lan";
    useDHCP = true;
    firewall = {
      enable = true;
    };
  };

  system.stateVersion = "24.05";
}
