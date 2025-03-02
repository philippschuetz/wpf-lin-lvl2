{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      # gateway
      "gateway" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};

        modules = [
          ./hosts/gateway/default.nix
        ];
      };
      # docu
      "docu" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};

        modules = [
          ./hosts/docu/default.nix
        ];
      };
    };
  };
}
