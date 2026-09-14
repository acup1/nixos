{ ... }: {
  services.frp.instances.sunshine = {
    enable = true;
    role = "client";
    # Не хранить токен в Git. Файл: FRP_TOKEN=<одинаковый токен с VPS>, mode 0600.
    environmentFiles = ["/etc/frp-sunshine.env"];

    settings = {
      serverAddr = "ru.cupscloud.ru";
      serverPort = 7000;
      loginFailExit = false;
      udpPacketSize = 1500;

      auth = {
        method = "token";
        token = "{{ .Envs.FRP_TOKEN }}";
      };

      transport = {
        protocol = "quic";
        poolCount = 5;
        tls.enable = true;
      };

      log = {
        to = "console";
        level = "info";
      };

      proxies =
        map (port: {
          name = "sunshine-udp-${toString port}";
          type = "udp";
          localIP = "127.0.0.1";
          localPort = port;
          remotePort = port;
        }) [
          47998
          47999
          48000
          48002
          48010
        ]
        ++ map (port: {
          name = "sunshine-tcp-${toString port}";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = port;
          remotePort = port;
        }) [
          47984
          47989
          47990
          48010
        ]
        ++ [
          {
            name = "ssh-tcp-2224";
            type = "tcp";
            localIP = "127.0.0.1";
            localPort = 22;
            remotePort = 2224;
          }
        ];
    };
  };
}
