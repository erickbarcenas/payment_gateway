defmodule PaymentGatewayWeb.MerchantView do
  use PaymentGatewayWeb, :view
  alias PaymentGatewayWeb.MerchantView

  def render("g_index.json", %{merchant: merchant}) do
    %{
      name: merchant.name
    }
  end

  def render("index.json", %{merchant: merchant}) do
    %{data: render_many(merchant, MerchantView, "merchant.json")}
  end

  def render("show.json", %{merchant: merchant}) do
    %{data: render_one(merchant, MerchantView, "merchant.json")}
  end

  

  def render("merchant.json", %{merchant: merchant}) do
    %{
      id: merchant.id,
      name: merchant.name
    }
  end
end
