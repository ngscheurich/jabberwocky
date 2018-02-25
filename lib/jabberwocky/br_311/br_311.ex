defmodule Jabberwocky.BR311 do
	@moduledoc """
	This is the boundary for the BR311 module. This module is
	responsible for handling all things related to interfacing
	with Baton Rouge’s 311 system.
	"""

	import Ecto.Query, warn: false
	alias Jabberwocky.BR311
	alias Jabberwocky.Repo

	alias BR311.ServiceRequest

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
	def update_service_request(%ServiceRequest{} = service_request, attrs) do
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

	alias BR311.User

	@doc """
	Creates a user.

	## Examples

		iex> create_user(%{field: value})
		{:ok, %User{}}

		iex> create_user(%{field: bad_value})
		{:error, %Ecto.Changeset{}}

	"""
	def create_user(attrs \\ %{}) do
		%User{}
		|> User.changeset(attrs)
		|> Repo.insert()
	end

	@doc """
	Updates a user.

	## Examples

		iex> update(service, %{field: new_value})
		{:ok, %Service{}}

		iex> update(service, %{field: bad_value})
		{:error, %Ecto.Changeset{}}

	"""
	def update_user(%User{} = user, attrs) do
		user
		|> User.changeset(attrs)
		|> Repo.update()
	end

	@doc """
	Gets a single user.

	Raises `Ecto.NoResultsError` if the user does not exist.

	## Examples

		iex> get_user!(123)
		%User{}

		iex> get_user!(456)
		** (Ecto.NoResultsError)

	"""
	def get_user!(id), do: Repo.get!(User, id)

	@doc """
	#TODO This should not be a bang function
	
	Gets a single user by `attrs`.

	Returns nil if the user does not exist.

	## Examples

		iex> get_user_by!(%{phone_number: "+12251234567"})
		%User{}

		iex> get_user_by!(%{phone_number: "+12252345678"})
		nil

	"""
	def get_user_by!(attrs), do: Repo.get_by(User, attrs)

	@doc """
	Deletes a user.

	## Examples
		iex> delete_user(service)
		{:ok, %Service{}}

		iex> delete_user(service)
		{:error, %Ecto.Changeset{}}

	"""
	def delete_user(%User{} = user) do
		Repo.delete(user)
	end
end
