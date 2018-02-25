defmodule Jabberwocky.BR311.User do
  @moduledoc """
  Represents an individual on whose behalf the Jabberwocky has
  interfaced with Baton Rouge’s 311 system.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias __MODULE__
  alias Jabberwocky.BR311.ServiceRequest

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  
  schema "users" do
    field :twilio_id, :string
    field :phone_number, :string

    has_many :service_requests, ServiceRequest

    timestamps()
  end

  @doc false
  def changeset(%User{} = user , attrs) do
    user
    |> cast(attrs, [:twilio_id, :phone_number])
  end
end
