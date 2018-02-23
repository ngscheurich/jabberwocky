defmodule Jabberwocky.ServiceRequestsTest do
  use Jabberwocky.DataCase

  alias Jabberwocky.ServiceRequests

  describe "service_requests" do
    alias Jabberwocky.ServiceRequests.ServiceRequest

    @valid_attrs %{status: "open"}
    @update_attrs %{status: "closed"}
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

    test "update/2 with valid data updates the service request" do
      service_request = service_request_fixture()
      assert {:ok, service_request} = ServiceRequests.update(service_request, @update_attrs)
      assert %ServiceRequest{} = service_request
    end

    test "update/2 with invalid data returns error changeset" do
      service_request = service_request_fixture()

      assert {:error, %Ecto.Changeset{}} = ServiceRequests.update(service_request, @invalid_attrs)

      assert service_request == ServiceRequests.get!(service_request.id)
    end
  end
end
