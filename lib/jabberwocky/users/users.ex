defmodule Jabberwocky.Users do
	@moduledoc """
	This is the boundary for the Users module.
	"""

	import Ecto.Query, warn: false
	alias Jabberwocky.Repo
	alias Jabberwocky.Users.User

	@doc """
	Creates a user.

	## Examples

		iex> create(%{field: value})
		{:ok, %User{}}

		iex> create(%{field: bad_value})
		{:error, %Ecto.Changeset{}}

	"""
	def create(attrs \\ %{}) do
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
	def update(%User{} = user, attrs) do
		user
		|> User.changeset(attrs)
		|> Repo.update()
	end

	@doc """
	Gets a single user.

	Raises `Ecto.NoResultsError` if the user does not exist.

	## Examples

		iex> get(123)
		%User{}

		iex> get!(456)
		** (Ecto.NoResultsError)

	"""
	def get!(id), do: Repo.get!(User, id)

	@doc """
	Deletes a user.

	## Examples
		iex> delete(service)
		{:ok, %Service{}}

		iex> delete(service)
		{:error, %Ecto.Changeset{}}

	"""
	def delete(%User{} = user) do
		Repo.delete(user)
	end
end
