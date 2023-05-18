{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    # home-manager = {
    #   url = "github:nix-community/home-manager/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    (
      {
        nixosConfigurations."NixOS-matrix" = nixpkgs.lib.nixosSystem {
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