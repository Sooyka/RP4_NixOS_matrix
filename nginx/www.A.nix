{
  # addSSL = true;                                                                                                                                                                                           
  forceSSL = true;
  # onlySSL = true;
  enableACME = true;                                                                                                                                                                                       

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  # root = "/var/https_server/www";                                                                                                                                                                          

  locations."/" = {                                                                                                                                                                                        
      root = "/var/https_server/www";                                                                                                                                                                          
      index = "index.html";                                                                                                                                                                                                           
  };
  locations."/files/" = {                                                                                                                                                                                        
      root = "/var/https_server/";                                                                                                                                                                          
      # index = "index.html";
      extraConfig = "autoindex on;" + "autoindex_localtime on;";                                                                                                                                                                                                           
      # extraConfig = "autoindex on;";
  };
}