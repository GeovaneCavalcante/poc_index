defmodule PocIndex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PocIndexWeb.Telemetry,
      PocIndex.Repo,
      {DNSCluster, query: Application.get_env(:poc_index, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PocIndex.PubSub},
      # Start a worker by calling: PocIndex.Worker.start_link(arg)
      # {PocIndex.Worker, arg},
      # Start to serve requests, typically the last entry
      PocIndexWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PocIndex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PocIndexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
