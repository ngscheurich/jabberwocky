defmodule Jabberwocky.ServiceRequests do
  @defmodule """
  This is the boundary for the ServiceRequests module.
  """

  import Ecto.Query, warn: false
  alias Jabberwocky.Repo
  alias Jabberwocky.ServiceRequests.ServiceRequest

  @doc """
  Creates a service request.
  
  ## Examples
  
    iex> create(%{field: value})
    {:ok, %ServiceRequest{}}
  
    iex> create(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %ServiceRequest{}
    |> ServiceRequest.changeset(attrs)
    |> Repo.insert()
  end
end
