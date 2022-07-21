defmodule RestHouseApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RestHouseApi.Repo,
      # Start the Telemetry supervisor
      RestHouseApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RestHouseApi.PubSub},
      # Start the Endpoint (http/https)
      RestHouseApiWeb.Endpoint
      # Start a worker by calling: RestHouseApi.Worker.start_link(arg)
      # {RestHouseApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RestHouseApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RestHouseApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
