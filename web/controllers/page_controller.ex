defmodule Exam1.PageController do
  use Exam1.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
