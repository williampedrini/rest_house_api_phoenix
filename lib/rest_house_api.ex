defmodule RestHouseApi do
  @moduledoc """
  RestHouseApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def entity do
    quote do
      import Ecto.Schema
      import Ecto.Changeset
    end
  end
end
