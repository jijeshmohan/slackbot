defmodule Slackbot do
    require Logger
    use Application

    def start(_type, _args) do
        import Supervisor.Spec, warn: false

        children = [
            worker(SlackRtm, ["xoxb-73625536838-5vd87WIUJCJ68Z1DpK1KAYKq"]),
        ]

        opts = [strategy: :one_for_one, name: Slackbot.Supervisor]
        Supervisor.start_link(children, opts)
    end

end
