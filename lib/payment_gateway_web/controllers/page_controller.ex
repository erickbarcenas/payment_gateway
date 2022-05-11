defmodule PaymentGatewayWeb.PageController do
  use PaymentGatewayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
