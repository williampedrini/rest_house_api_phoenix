defmodule RestHouseApi.Repositories.UserRepository do
  @moduledoc """
  Represents the module responsible for acting as the Data Access Layer for the `RestHouseApi.Entity.User` entity.
  """
  @moduledoc since: "1.0.0"

  alias RestHouseApi.Repo
  alias RestHouseApi.Entity.User

  @doc """
  Find already existing user based on an `email`.

  Returns The found user based on the e-mail.
  """
  @doc since: "1.0.0"
  def find_by_email(email) do
    Repo.get_by(User, email: String.downcase(email))
  end

  @doc """
  Persists a new `user` into the database if it does not exist.
  """
  @doc since: "1.0.0"
  def create(%User{id: user_id, email: user_email, password: user_password}) do
    %User{}
    |> User.changeset(%{id: user_id, email: user_email, password: user_password})
    |> Repo.insert()
  end
end
