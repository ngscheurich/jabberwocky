defmodule Jabberwocky.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:twilio_id, :string)
      add(:phone_number, :string)

      timestamps()
    end

    create(unique_index(:users, [:phone_number]))
    create(index(:users, [:twilio_id]))
  end
end
