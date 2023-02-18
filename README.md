# RP4 NixOS matrix
NixOS configuration for a matrix server running on Raspberry Pi 4

Ready for deployment on Raspberry Pi 4 or x86 after slight tweaking (I plan to automate it).

For now there is no turn server.

## Deployment
There is only one file that needs to be changed -- 'particularisation_config.nix', where one should write 
a particular data relevant to their instance, i.e.:

  - email address (encouraged for remainders about expiring SSL certificates)

  - domain name (domain name pointing at your server)
 
  - achitecture (system: "aarch64-linux", config: "aarch64-unknown-linux-gnu" for Raspberry)
  
  - keys paths -- paths to the keys files for matrix-synapse server -- keys can be generated and provided to the server at thouse paths


