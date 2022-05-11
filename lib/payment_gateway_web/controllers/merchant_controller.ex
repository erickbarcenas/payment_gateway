defmodule PaymentGatewayWeb.MerchantController do
  use PaymentGatewayWeb, :controller

  alias PaymentGateway.Services.MerchantService
  alias PaymentGateway.Models.Merchant

  action_fallback PaymentGatewayWeb.FallbackController

  def index(conn, _params) do
    merchant = MerchantService.list_merchant()
    render(conn, "index.json", merchant: merchant)
  end

  def create(conn, %{"merchant" => merchant_params}) do
    with {:ok, %Merchant{} = merchant} <- MerchantService.create_merchant(merchant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.merchant_path(conn, :show, merchant))
      |> render("show.json", merchant: merchant)
    end
  end

  def show(conn, %{"id" => id}) do
    merchant = MerchantService.get_merchant!(id)
    render(conn, "show.json", merchant: merchant)
  end

  def update(conn, %{"id" => id, "merchant" => merchant_params}) do
    merchant = MerchantService.get_merchant!(id)

    with {:ok, %Merchant{} = merchant} <- MerchantService.update_merchant(merchant, merchant_params) do
      render(conn, "show.json", merchant: merchant)
    end
  end

  def delete(conn, %{"id" => id}) do
    merchant = MerchantService.get_merchant!(id)

    with {:ok, %Merchant{}} <- MerchantService.delete_merchant(merchant) do
      send_resp(conn, :no_content, "")
    end
  end
end
