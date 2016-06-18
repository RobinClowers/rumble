defmodule Rumble.Repo do
  alias Rumble.User

  @moduledoc """
  In memory repository.
  """

  def all(Rumble.User) do
    [
      %User{id: "1", name: "José", username: "josevalim", password: "elixir"},
      %User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
      %User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    module
    |> all
    |> Enum.find(&(&1.id == id))
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, value} -> Map.get(map, key) == value end)
    end
  end
end
