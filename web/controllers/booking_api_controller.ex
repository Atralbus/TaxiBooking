defmodule Exam1.BookingAPIController do
  use Exam1.Web, :controller
  import Ecto.Query, only: [from: 2]
  alias Exam1.{Taxi,Repo}

  def create(conn, _params) do
    query = from t in Taxi, where: t.status == "available", select: t
    available_taxis = Repo.all(query)
    if length(available_taxis) > 0 do
      taxi = List.first(available_taxis)
      conn
      |> put_status(201)
      |> json(%{msg: "We are processing your request"})
    else
      conn
      |> put_status(406)
      |> json(%{msg: "Our apologies, we cannot serve your request in this moment"})
    end
  end
end
