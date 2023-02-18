{
  enableACME = true;
  forceSSL = true;
  
  location."/" = {
    root = "/var/https_server";
    index = "coturn_index.html";
  };
}