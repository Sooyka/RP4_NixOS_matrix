{
	# import ./ACME_SSL.nix
	# addSSL = true;
  # enableACME = true;
	
	locations."/" = {
      root = "/home/nixos/https_server";
  };
}