defmodule Jabberwocky.User do
  @defmodule """
  Represents a person who has interacted with the jabberwocky.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  
  schema "users" do
    field :twilio_id, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user , attrs) do
    user
    |> cast(attrs, [:twilio_id, :phone_number])
  end
end

