defmodule RestHouseApi.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false, unique: true
      add :password, :string, null: false
      timestamps()
    end
  end
end
