defmodule RestHouseApi.UseCase.FindUser do
  @moduledoc "Use case responsible for searching for users based on certain conditions."
  @moduledoc since: "1.0.0"
  alias RestHouseApi.Entity.User
  alias RestHouseApi.Repositories.UserRepository
  alias RestHouseApi.UseCase.Model.User, as: UserModel

  @doc """
  Find already existing user based on an `email`.

  Return The found user based on the e-mail.
  """
  @doc since: "1.0.0"
  def find_existent_by_email(email) do
    case UserRepository.find_by_email(email) do
      nil -> raise ArgumentError, message: "The user with the email=#{email} does not exist."
      %User{email: user_email, password: user_password} -> %UserModel{email: user_email, password: user_password}
    end
  end
end
