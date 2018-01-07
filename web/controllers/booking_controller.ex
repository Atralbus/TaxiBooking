defmodule Exam1.BookingController do
  use Exam1.Web, :controller
  import Ecto.Query, only: [from: 2]
  alias Exam1.{Booking, Taxi, Repo}

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new(conn, _params) do
    render conn, "new.html", changeset: Booking.changeset(%Booking{})
  end

  def create(conn, _params) do
    query = from t in Taxi, where: t.status == "available", select: t
    available_taxis = Repo.all(query)
    if length(available_taxis) > 0 do
      conn
      |> put_flash(:info, "Your taxi will arrive in 5 minutes")
      |> redirect(to: booking_path(conn, :index))
    else
      conn
      |> put_flash(:error, "At present, there is no taxi available!")
      |> redirect(to: booking_path(conn, :index))
    end
    
  end
end
