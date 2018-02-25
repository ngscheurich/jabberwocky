defmodule JabberwockyWeb.ServiceRequestControllerTest do
  use JabberwockyWeb.ConnCase

  alias Jabberwocky.BR311

  @create_attrs %{
    phone_number: "+12251234567",
    address: "123 Any St",
    type: "1",
    image_url: "",
    notify: "no"
  }
  @invalid_attrs %{type: "residual_dark_magicks_from_ritual"}

  def service_request_fixture(attrs \\ @create_attrs) do
    {:ok, service_request} = BR311.create_service_request(attrs)
    service_request
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create service request" do
    test "renders service_request when data is valid", %{conn: conn} do
      conn = post(conn, service_request_path(conn, :create), @create_attrs)
      assert json_response(conn, 201)["data"]["type"] == "tall_grass"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, service_request_path(conn, :create), @invalid_attrs)
      assert text_response(conn, 422)
    end
  end
end
