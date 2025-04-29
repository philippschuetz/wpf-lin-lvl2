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
      "network"
      "wheel"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 changeme philipp"
    ];
    password = "initial";
  };
}
