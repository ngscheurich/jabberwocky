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
	@spec create_service_request(attrs :: map) :: {:ok, %ServiceRequest{}} | {:error, Ecto.Changeset.t()}
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
	@spec update_service_request(%ServiceRequest{}, attrs :: map()) :: {:ok, %ServiceRequest{}} | {:error, Ecto.Changeset.t()}
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
	@spec get_service_request!(id :: integer()) :: %ServiceRequest{} | no_return()
	def get_service_request!(id), do: Repo.get!(ServiceRequest, id)

	@doc """
	Deletes a service request.

	## Examples
		iex> delete_service_request(service)
		{:ok, %ServiceRequest{}}

		iex> delete_service_request(service)
		{:error, %Ecto.Changeset{}}

	"""
	@spec delete_service_request(%ServiceRequest{}) :: {:ok, %ServiceRequest{}} | {:error, Ecto.Changeset.t()}
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
	@spec create_user(attrs :: map) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
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
	@spec update_user(%User{}, attrs :: map) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
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
	@spec get_user!(id :: integer()) :: %User{} | no_return()
	def get_user!(id), do: Repo.get!(User, id)

	@doc """
	Gets a single user by `attrs`.

	Returns nil if the user does not exist.

	## Examples

		iex> get_user_by(%{phone_number: "+12251234567"})
		%User{}

		iex> get_user_by(%{phone_number: "+12252345678"})
		nil

	"""
	@spec get_user_by(attrs :: map()) :: %User{} | nil
	def get_user_by(attrs), do: Repo.get_by(User, attrs)

	@doc """
	Deletes a user.

	## Examples
		iex> delete_user(service)
		{:ok, %Service{}}

		iex> delete_user(service)
		{:error, %Ecto.Changeset{}}

	"""
	@spec delete_user(%User{}) :: {:ok, %ServiceRequest{}} | {:error, Ecto.Changeset.t()}
	def delete_user(%User{} = user) do
		Repo.delete(user)
	end
end
