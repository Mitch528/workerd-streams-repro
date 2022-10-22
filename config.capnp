using Workerd = import "/workerd/workerd.capnp";

const config :Workerd.Config = (
    services = [
        (name = "main", worker = .mainWorker),
    ],

    sockets = [
        # Serve HTTP on port 8080.
        ( name = "http",
            address = "*:8080",
            http = (),
            service = "main"
        ),
    ]
);

const mainWorker :Workerd.Worker = (
    compatibilityDate = "2022-09-26",
    compatibilityFlags = ["streams_enable_constructors"],

    modules = [
        ( name = "worker.js", esModule = embed "worker.js" ),
    ],
);