{
  description = "chancebook — NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url                    = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url                    = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.chancebook = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/chancebook/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs      = true;
          home-manager.useUserPackages    = true;
          home-manager.users.chance       = import ./home/home.nix;
          home-manager.extraSpecialArgs   = { inherit inputs; };
        }
      ];
    };
  };
}
