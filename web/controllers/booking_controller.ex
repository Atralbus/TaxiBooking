defmodule Exam1.BookingController do
  use Exam1.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
