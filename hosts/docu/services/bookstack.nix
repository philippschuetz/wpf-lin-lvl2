let
  domain = "bookstack.philippschuetz.com";
  port = "80";
in
  {pkgs, ...}: {
    services.bookstack = {
      user = "bookstack";
      group = "bookstack";
      package = pkgs.bookstack;
      enable = true;
      dataDir = "/var/lib/bookstack";
      hostname = domain;
      appURL = domain;
      # https://github.com/BookStackApp/BookStack/blob/development/.env.example.complete
      config = {
        APP_TIMEZONE = "Europe/Berlin";
        AUTH_METHOD = "standard";
        # PASSWORD = {_secret = "/run/keys/bookstack_secret";};
      };
    };

    services.nginx.virtualHosts = {
      "${domain}" = {
        serverName = domain;

        locations."/" = {
          proxyPass = "http://127.0.0.1:${port}";
        };

        enableACME = true;
        forceSSL = true;
      };
    };
  }
