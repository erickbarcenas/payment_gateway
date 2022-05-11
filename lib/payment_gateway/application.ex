defmodule PaymentGateway.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # start bolt
      # {Bolt.Sips, Application.get_env(:bolt_sips, Bolt)},
      # Start the Ecto repository
      PaymentGateway.Repo,
      # Start the Telemetry supervisor
      PaymentGatewayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PaymentGateway.PubSub},
      # Start the Endpoint (http/https)
      PaymentGatewayWeb.Endpoint
      # Start a worker by calling: PaymentGateway.Worker.start_link(arg)
      # {PaymentGateway.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PaymentGateway.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PaymentGatewayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
