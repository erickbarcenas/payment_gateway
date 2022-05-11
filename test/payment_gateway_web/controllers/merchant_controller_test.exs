defmodule PaymentGatewayWeb.MerchantControllerTest do
  use PaymentGatewayWeb.ConnCase

  import PaymentGateway.ModelsFixtures

  alias PaymentGateway.Models.Merchant

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all merchant", %{conn: conn} do
      conn = get(conn, Routes.merchant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create merchant" do
    test "renders merchant when data is valid", %{conn: conn} do
      conn = post(conn, Routes.merchant_path(conn, :create), merchant: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.merchant_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.merchant_path(conn, :create), merchant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update merchant" do
    setup [:create_merchant]

    test "renders merchant when data is valid", %{conn: conn, merchant: %Merchant{id: id} = merchant} do
      conn = put(conn, Routes.merchant_path(conn, :update, merchant), merchant: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.merchant_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, merchant: merchant} do
      conn = put(conn, Routes.merchant_path(conn, :update, merchant), merchant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete merchant" do
    setup [:create_merchant]

    test "deletes chosen merchant", %{conn: conn, merchant: merchant} do
      conn = delete(conn, Routes.merchant_path(conn, :delete, merchant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.merchant_path(conn, :show, merchant))
      end
    end
  end

  defp create_merchant(_) do
    merchant = merchant_fixture()
    %{merchant: merchant}
  end
end
