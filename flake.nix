{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    # home-manager = {
    #   url = "github:nix-community/home-manager/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  	fan_controller = {
				url = "github:Sooyka/RP4_fan_service/main";
				inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    (
      {
        nixosConfigurations.RP4NixOS = nixpkgs.lib.nixosSystem {
          # system = "x86_64-linux";
          modules = [
            # home-manager.nixosModules.home-manager {
            #   home-manager.extraSpecialArgs = { inherit inputs; };
            # }
            ./configuration.nix
          ];
        };
      }
    );
}