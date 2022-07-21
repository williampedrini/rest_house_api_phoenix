defmodule RestHouseApi.UseCase.CreateUser do
  @moduledoc "Use case responsible for creating users based on certain information."
  @moduledoc since: "1.0.0"

  alias RestHouseApi.Repositories.UserRepository
  alias RestHouseApi.UseCase.Model.User, as: UserModel
  alias RestHouseApi.Entity.User, as: UserEntity

  @doc "Persists a new `user` into the database if it does not exist."
  @doc since: "1.0.0"
  def create(%UserModel{id: user_id, email: user_email, password: user_password}) do
    check_user_already_registered(user_email)

    UserRepository.create(%UserEntity{
      id: user_id,
      email: user_email,
      password: user_password
    })
  end

  defp check_user_already_registered(email) do
    if(UserRepository.find_by_email(email) != nil) do
      raise ArgumentError, message: "The user with the email=#{email} already exists."
    end
  end
end
