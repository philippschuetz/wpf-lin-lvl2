{
  pkgs,
  config,
  inputs,
  outputs,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = true;
  users.users."philipp" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ifTheyExist [
      "audio"
      "network"
      "video"
      "wheel"
      "podman"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 changeme philipp"
    ];
    password = "initial";
  };

  home-manager = {
    useGlobalPkgs = true;
    users."philipp" = {
      imports = [
        ../../../../home/philipp/${config.networking.hostName}.nix
      ];
    };
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };
}
