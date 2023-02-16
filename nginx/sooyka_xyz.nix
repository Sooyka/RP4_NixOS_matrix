{
	# import ./ACME_SSL.nix
	addSSL = true;
  enableACME = true;
	
	locations."/" = {
      root = "/var/https_server";

  };
}