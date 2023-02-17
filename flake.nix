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

    rp4_hardware = {
      url = "github:NixOS/nixos-hardware/master";
      # rev = "b7ac0a56029e4f9e6743b9993037a5aaafd57103";
      # inputs.nixpkgs.follows = "nixpkgs";    
    };
    
  };

  outputs =
    { self, nixpkgs, rp4_hardware, fan_controller, ... }@inputs:
    (
      {
        nixosConfigurations."RP4-NixOS" = nixpkgs.lib.nixosSystem {
          specialArgs.rp4_hardware = inputs.rp4_hardware;
          specialArgs.fan_controller = inputs.fan_controller;
          # system = "aarch64-linux";
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