defmodule RestHouseApiWeb.Router do
  use RestHouseApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RestHouseApiWeb do
    post("/users", UserController, :create)
    get("/users", UserController, :find_all)
  end
end
