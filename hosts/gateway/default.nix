{
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/philipp
  ];

  networking = {
    hostName = "gateway.FI-C-32.oszimt.lan";
    useDHCP = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 ];
    };
    interfaces = {
      ens3.useDHCP = true;
      ens4.ipv4.addresses = [{
        address = "192.168.100.1";
      }];
    };
    nat = {
      enable = true;
      internalInterfaces = ["ens4"];
      externalInterface = "ens3";
      forwardPorts = [
        {
          destination = "192.168.100.2:80";
          proto = "tcp";
          sourcePort = 80;
        }
      ];
    }
  };

  system.stateVersion = "24.11";
}
