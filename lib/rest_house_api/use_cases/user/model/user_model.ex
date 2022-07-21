defmodule RestHouseApi.UseCase.Model.User do
  defstruct [:id, :email, :password]

  defimpl Jason.Encoder do
    def encode(%RestHouseApi.UseCase.Model.User{id: _id, email: email, password: password}, opts) do
      Jason.Encode.map(%{"email" => email, "password" => password}, opts)
    end
  end
end