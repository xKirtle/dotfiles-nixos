{ config, pkgs, lib, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
    enableTCPIP = true;

    settings = {
      listen_addresses = lib.mkForce "127.0.0.1";
      port = 5432;
    };

    ensureUsers = [
      {
        name = "postgres";
        ensureDBOwnership = true;
      }
    ];

    ensureDatabases = [ "postgres" ];
  };
}
