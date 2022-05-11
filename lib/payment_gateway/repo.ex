defmodule PaymentGateway.Repo do
  use Ecto.Repo,
    otp_app: :payment_gateway,
    adapter: Ecto.Adapters.Postgres
end
