defmodule Exam1.BookingController do
  use Exam1.Web, :controller
  alias Exam1.Booking

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new(conn, _params) do
    render conn, "new.html", changeset: Booking.changeset(%Booking{})
  end

  def create(conn, _params) do
    conn
    |> put_flash(:info, "Your taxi will arrive in 5 minutes")
    |> redirect(to: booking_path(conn, :index))
  end
end
