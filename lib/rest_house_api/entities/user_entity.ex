defmodule RestHouseApi.Entity.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:password, :string)
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
