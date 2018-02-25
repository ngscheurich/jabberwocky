defmodule Jabberwocky.BR311Test do
  use Jabberwocky.DataCase

  alias Jabberwocky.BR311

  describe "service_requests" do
    alias BR311.ServiceRequest

    @valid_attrs %{status: "open"}
    @update_attrs %{status: "closed"}
    @invalid_attrs %{status: "completed"}

    def service_request_fixture(attrs \\ @valid_attrs) do
      {:ok, service_request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BR311.create_service_request()

      service_request
    end

    test "create_service_request/1 with valid data creates a service request" do
      assert {:ok, %ServiceRequest{}} = BR311.create_service_request(@valid_attrs)
    end

    test "create_service_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BR311.create_service_request(@invalid_attrs)
    end

    test "update_service_request/2 with valid data updates the service request" do
      sreq = service_request_fixture()
      assert {:ok, sreq} = BR311.update_service_request(sreq, @update_attrs)
      assert %ServiceRequest{} = sreq
    end

    test "update_service_request/2 with invalid data returns error changeset" do
      sreq = service_request_fixture()
      assert {:error, %Ecto.Changeset{}} = BR311.update_service_request(sreq, @invalid_attrs)
      assert sreq == BR311.get_service_request!(sreq.id)
    end

    test "delete_service_request/1 deletes the service request" do
      sreq = service_request_fixture()
      assert {:ok, %ServiceRequest{}} = BR311.delete_service_request(sreq)
      assert_raise Ecto.NoResultsError, fn -> BR311.get_service_request!(sreq.id) end
    end
  end

  describe "users" do
    alias BR311.User

    @valid_attrs %{twilio_id: "1"}
    @update_attrs %{twilio_id: "2"}

    def user_fixture(attrs \\ @valid_attrs) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BR311.create_user()

      user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{}} = BR311.create_user(@valid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = BR311.update_user(user, @update_attrs)
      assert %User{} = user
    end

    test "get_user_by/1 returns a matching user when one exists" do
      user = user_fixture(%{phone_number: "+12251234567"})
      assert BR311.get_user_by(%{phone_number: "+12251234567"}) == user
    end

    test "get_user_by/1 returns `nil` when none exists" do
      user_fixture(%{phone_number: "+12251234567"})
      assert BR311.get_user_by(%{phone_number: "+12252345678"}) |> is_nil()
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = BR311.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> BR311.get_user!(user.id) end
    end
  end
end
