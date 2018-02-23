defmodule Jabberwocky.ServiceRequests.ServiceRequest do
  @defmodule """
  Represents a service request filed with the city, along with 
  some additional data we need for tracking progress and sending
  status updates.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias __MODULE__
  alias JabberwockyWeb.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  
  schema "service_requests" do
    field :address, :string
    field :type, ServiceRequestTypeEnum
    field :notify, :boolean, default: false
    field :image_url, :string
    field :service_request_id, :string
    field :status, ServiceRequestStatusEnum
    
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%ServiceRequest{} = service_request, attrs) do
    service_request
    |> cast(attrs, [
      :address, 
      :type,
      :notify,
      :image_url,
      :service_request_id,
      :status,
      :user_id
    ])
  end
end
