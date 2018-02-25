defmodule Jabberwocky.ThreeOneOneTest do
  use Jabberwocky.DataCase

  alias Jabberwocky.ThreeOneOne

  describe "service_requests" do
    alias ThreeOneOne.ServiceRequest

    @valid_attrs %{status: "open"}
    @update_attrs %{status: "closed"}
    @invalid_attrs %{status: "completed"}

    def service_request_fixture(attrs \\ @valid_attrs) do
      {:ok, service_request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ThreeOneOne.create_service_request()

      service_request
    end

    test "create_service_request/1 with valid data creates a service request" do
      assert {:ok, %ServiceRequest{}} = ThreeOneOne.create_service_request(@valid_attrs)
    end

    test "create_service_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ThreeOneOne.create_service_request(@invalid_attrs)
    end

    test "update_service_request/2 with valid data updates the service request" do
      sreq = service_request_fixture()
      assert {:ok, sreq} = ThreeOneOne.update_service_request(sreq, @update_attrs)
      assert %ServiceRequest{} = sreq
    end

    test "update_service_request/2 with invalid data returns error changeset" do
      sreq = service_request_fixture()

      assert {:error, %Ecto.Changeset{}} =
               ThreeOneOne.update_service_request(sreq, @invalid_attrs)

      assert sreq == ThreeOneOne.get_service_request!(sreq.id)
    end

    test "delete_service_request/1 deletes the service request" do
      sreq = service_request_fixture()
      assert {:ok, %ServiceRequest{}} = ThreeOneOne.delete_service_request(sreq)
      assert_raise Ecto.NoResultsError, fn -> ThreeOneOne.get_service_request!(sreq.id) end
    end
  end

  describe "users" do
    alias ThreeOneOne.User

    @valid_attrs %{twilio_id: "1"}
    @update_attrs %{twilio_id: "2"}

    def user_fixture(attrs \\ @valid_attrs) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ThreeOneOne.create_user()

      user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{}} = ThreeOneOne.create_user(@valid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = ThreeOneOne.update_user(user, @update_attrs)
      assert %User{} = user
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = ThreeOneOne.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> ThreeOneOne.get_user!(user.id) end
    end
  end
end
