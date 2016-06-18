defmodule Rumble.UserController do
  use Rumble.Web, :controller
  alias Rumble.Repo
  alias Rumble.User

  def index(conn, _params) do
    users = Repo.all(User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    render conn, "show.html", user: user
  end

  def new(conn, params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end
end
