defmodule Jabberwocky.ServiceRequestsTest do
  use Jabberwocky.DataCase

  alias Jabberwocky.ServiceRequests

  describe "service_requests" do
    alias Jabberwocky.ServiceRequests.ServiceRequest

    @valid_attrs %{status: "open"}
    @invalid_attrs %{status: "completed"}

    def service_request_fixture(attrs \\ @valid_attrs) do
      {:ok, service_request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ServiceRequests.create()

      service_request
    end

    test "create/1 with valid data creates a service request" do
      assert {:ok, %ServiceRequest{}} = ServiceRequests.create(@valid_attrs)
    end

    test "create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ServiceRequests.create(@invalid_attrs)
    end
  end
end
