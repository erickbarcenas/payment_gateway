defmodule PaymentGateway.ModelsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PaymentGateway.Models` context.
  """

  @doc """
  Generate a merchant.
  """
  def merchant_fixture(attrs \\ %{}) do
    {:ok, merchant} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PaymentGateway.Models.create_merchant()

    merchant
  end
end
