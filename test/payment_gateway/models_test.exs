defmodule PaymentGateway.ModelsTest do
  use PaymentGateway.DataCase

  alias PaymentGateway.Models

  describe "merchant" do
    alias PaymentGateway.Models.Merchant

    import PaymentGateway.ModelsFixtures

    @invalid_attrs %{name: nil}

    test "list_merchant/0 returns all merchant" do
      merchant = merchant_fixture()
      assert Models.list_merchant() == [merchant]
    end

    test "get_merchant!/1 returns the merchant with given id" do
      merchant = merchant_fixture()
      assert Models.get_merchant!(merchant.id) == merchant
    end

    test "create_merchant/1 with valid data creates a merchant" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Merchant{} = merchant} = Models.create_merchant(valid_attrs)
      assert merchant.name == "some name"
    end

    test "create_merchant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Models.create_merchant(@invalid_attrs)
    end

    test "update_merchant/2 with valid data updates the merchant" do
      merchant = merchant_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Merchant{} = merchant} = Models.update_merchant(merchant, update_attrs)
      assert merchant.name == "some updated name"
    end

    test "update_merchant/2 with invalid data returns error changeset" do
      merchant = merchant_fixture()
      assert {:error, %Ecto.Changeset{}} = Models.update_merchant(merchant, @invalid_attrs)
      assert merchant == Models.get_merchant!(merchant.id)
    end

    test "delete_merchant/1 deletes the merchant" do
      merchant = merchant_fixture()
      assert {:ok, %Merchant{}} = Models.delete_merchant(merchant)
      assert_raise Ecto.NoResultsError, fn -> Models.get_merchant!(merchant.id) end
    end

    test "change_merchant/1 returns a merchant changeset" do
      merchant = merchant_fixture()
      assert %Ecto.Changeset{} = Models.change_merchant(merchant)
    end
  end
end
