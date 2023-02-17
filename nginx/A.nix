{
	# import ./ACME_SSL.nix
	# addSSL = true;
	forceSSL = true;
	# onlySSL = true;
  enableACME = true;
	
	locations."/" = {
      root = "/var/https_server";
			# return = "301 https://www.$host/";
  };
	locations."/files/" = {
      # root = "/var/https_server";
	    return = "301 https://www.$host/files/";
  };
}