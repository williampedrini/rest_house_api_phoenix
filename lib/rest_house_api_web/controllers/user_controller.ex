defmodule RestHouseApiWeb.UserController do
  use RestHouseApiWeb, :controller
  alias RestHouseApi.UseCase.CreateUser, as: CreateUserUseCase
  alias RestHouseApi.UseCase.FindUser, as: FindUserUseCase
  alias RestHouseApi.UseCase.Model.User, as: UserModel

  def create(connection, %{"email" => user_email, "password" => user_password}) do
    CreateUserUseCase.create(%UserModel{email: user_email, password: user_password})
    send_resp(connection, :no_content, "")
  end

  def find_all(connection, _params) do
    found_user = FindUserUseCase.find_existent_by_email(connection.query_params["email"])
    json(connection, found_user)
  end
end
