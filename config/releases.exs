import Config

name = "trainer1a"

config :libcluster,
  topologies: [
    nook_book: [
      strategy: Cluster.Strategy.Epmd,
      config: [
        hosts: [
          :"nook_book@10.0.1.180",
          :"nook_book@10.0.1.4"
        ]
      ]
    ]
  ]

config :nook_book, cluster_role: System.get_env("CLUSTER_ROLE", "member") |> String.to_atom()

config :nook_book, NookBookWeb.Endpoint,
  server: true,
  url: [host: "#{name}.nookbook.online"],
  http: [port: 4000],
  secret_key_base: "UrDVw1oyzfrMpadrOQiUrD1NNc+Aaw+BlnQsvT2mU1G8xLYMo5Ia146X5lwzWh26"
