defmodule Exam1.UserController do
  use Exam1.Web, :controller
  alias Exam1.{Repo, User}

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end
end
