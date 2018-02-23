defmodule Jabberwocky.UsersTest do
  use Jabberwocky.DataCase

  alias Jabberwocky.Users

  describe "users" do
    alias Jabberwocky.Users.User

    @valid_attrs %{twilio_id: "1"}
    @update_attrs %{twilio_id: "2"}

    def user_fixture(attrs \\ @valid_attrs) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create()

      user
    end

    test "create/1 with valid data creates a user" do
      assert {:ok, %User{}} = Users.create(@valid_attrs)
    end

    test "update/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Users.update(user, @update_attrs)
      assert %User{} = user
    end

    test "delete/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get!(user.id) end
    end
  end
end
