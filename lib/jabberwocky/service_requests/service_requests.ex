defmodule Jabberwocky.ServiceRequests do
	@moduledoc """
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

	@doc """
	Updates a service request.

	## Examples

		iex> update(service, %{field: new_value})
		{:ok, %Service{}}

		iex> update(service, %{field: bad_value})
		{:error, %Ecto.Changeset{}}

	"""
	def update(%ServiceRequest{} = service_request, attrs) do
		service_request
		|> ServiceRequest.changeset(attrs)
		|> Repo.update()
	end

	@doc """
	Gets a single service request.

	Raises `Ecto.NoResultsError` if the service request does not exist.

	## Examples

		iex> get(123)
		%ServiceRequest{}

		iex> get!(456)
		** (Ecto.NoResultsError)

	"""
	def get!(id), do: Repo.get!(ServiceRequest, id)

	@doc """
	Deletes a service request.

	## Examples
		iex> delete(service)
		{:ok, %Service{}}

		iex> delete(service)
		{:error, %Ecto.Changeset{}}

	"""
	def delete(%ServiceRequest{} = service_request) do
		Repo.delete(service_request)
	end
end
