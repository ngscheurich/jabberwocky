defmodule Jabberwocky.Repo.Migrations.CreateServiceRequests do
  use Ecto.Migration

  def up do
    ServiceRequestTypeEnum.create_type()
    ServiceRequestStatusEnum.create_type()

    create table(:service_requests, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:address, :string)
      add(:type, :service_request_type)
      add(:notify, :boolean, default: false)
      add(:image_url, :string)
      add(:service_request_id, :string)
      add(:status, :service_request_status)

      timestamps()
    end
  end

  def down do
    ServiceRequestTypeEnum.drop_type()
    ServiceRequestStatusEnum.drop_type()
  end
end
