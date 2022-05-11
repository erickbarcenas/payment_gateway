defmodule PaymentGateway.Services.MerchantGraphService do
  @moduledoc """
  The Models context.
  """

  import Ecto.Query, warn: false
  alias PaymentGateway.RepoGraph

  @doc """
  Returns the list of merchant.

  ## Examples

      iex> list_merchant()
      [%Merchant{}, ...]

  """
  def list_merchant do
    RepoGraph.all()
  end

end
