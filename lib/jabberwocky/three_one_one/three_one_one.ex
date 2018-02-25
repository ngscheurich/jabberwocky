defmodule Jabberwocky.ThreeOneOne do
	@moduledoc """
	This is the boundary for the ThreeOneOne module. This module is
	responsible for handling all things related to interfacing with
	Baton Rouge’s 311 system.
	"""

	import Ecto.Query, warn: false
	alias Jabberwocky.Repo

	alias Jabberwocky.ThreeOneOne.ServiceRequest

	@doc """
	Creates a service request.

	## Examples

		iex> create_service_request(%{field: value})
		{:ok, %ServiceRequest{}}

		iex> create_service_request(%{field: bad_value})
		{:error, %Ecto.Changeset{}}

	"""
	def create_service_request(attrs \\ %{}) do
		%ServiceRequest{}
		|> ServiceRequest.changeset(attrs)
		|> Repo.insert()
	end

	@doc """
	Updates a service request.

	## Examples

		iex> update_service_request(service, %{field: new_value})
		{:ok, %Service{}}

		iex> update_service_request(service, %{field: bad_value})
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

		iex> get_service_request!(123)
		%ServiceRequest{}

		iex> get_service_request!(456)
		** (Ecto.NoResultsError)

	"""
	def get_service_request!(id), do: Repo.get!(ServiceRequest, id)

	@doc """
	Deletes a service request.

	## Examples
		iex> delete_service_request(service)
		{:ok, %ServiceRequest{}}

		iex> delete_service_request(service)
		{:error, %Ecto.Changeset{}}

	"""
	def delete_service_request(%ServiceRequest{} = service_request) do
		Repo.delete(service_request)
	end
end
