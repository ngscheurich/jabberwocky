defmodule Jabberwocky.Repo.Migrations.AddUserIdToServiceRequests do
  use Ecto.Migration

  def change do
    alter table(:service_requests) do
      add(:user_id, references(:users, on_delete: :nothing, type: :uuid))
    end

    create(index(:service_requests, [:user_id]))
  end
end
