defmodule PaymentGatewayWeb.MerchantGraphController do
    alias PaymentGateway.Services.MerchantGraphService

  
    
  
    def index(conn, _params) do
      merchant = MerchantGraphService.list_merchant()
      render(conn, "g_index.json", merchant: merchant)
    end
end