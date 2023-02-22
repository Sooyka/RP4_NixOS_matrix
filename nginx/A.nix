{particularisation_config}:
{
	# import ./ACME_SSL.nix
	# addSSL = true;
	forceSSL = true;
	# onlySSL = true;
  enableACME = true;
	
	# root = "/var/https_server";
	
	locations."/" = {
      root = "/var/https_server";
			index = "www/index.html";
			# return = "301 https://www.$host/";
  };
	locations."/files/" = {
      # root = "/var/https_server";
	    return = "301 https://www.$host/files/";
  };
	locations."/.well-known/matrix/server" = {
		extraConfig = "add_header Content-Type application/json;" +
    "add_header Access-Control-Allow-Origin *;";
		return = "200 '${builtins.toJSON {
			"m.server" = "matrix." + particularisation_config.domain_name + ":8448";
		}}'";
	};
	locations."/.well-known/matrix/client" = {
		extraConfig = "add_header Content-Type application/json;" + 
   "add_header Access-Control-Allow-Origin *;";
		return = "200 '${builtins.toJSON {
			"m.homeserver" = {"base_url" = "https://matrix." + particularisation_config.domain_name;};
			"m.identity_server" = {};
		}}'";
	}; 
}