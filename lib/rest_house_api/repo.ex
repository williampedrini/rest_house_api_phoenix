defmodule RestHouseApi.Repo do
  use Ecto.Repo,
    otp_app: :rest_house_api,
    adapter: Ecto.Adapters.Postgres
end
