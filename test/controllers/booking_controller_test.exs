defmodule Exam1.BookingControllerTest do
  use Exam1.ConnCase

  alias Exam1.{Repo,Taxi,Booking}

  test "booking requires a 'pickup address'" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: nil, dropoff_address: "Liivi 2"})
    assert Keyword.has_key? changeset.errors, :pickup_address
  end

  test "booking requires a 'dropoff address'" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: "Lõunakeskus", dropoff_address: nil})
    assert Keyword.has_key? changeset.errors, :dropoff_address
  end

  test "booking 'pickup address' and 'dropoff address' cannot be same" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: "Lõunakeskus", dropoff_address: "Lõunakeskus"})
    assert Keyword.has_key? changeset.errors, :difference
  end

  test "Booking rejection", %{conn: conn} do
    Repo.insert!(%Taxi{status: "busy"})
    conn = post conn, "/bookings", %{booking: [pickup_address: "Liivi 2", dropoff_address: "Lõunakeskus"]}
    conn = get conn, redirected_to(conn)
    assert html_response(conn, 200) =~ ~r/At present, there is no taxi available!/
  end

  test "Booking aceptance", %{conn: conn} do
    Repo.insert!(%Taxi{status: "available"})
    conn = post conn, "/bookings", %{booking: [pickup_address: "Liivi 2", dropoff_address: "Lõunakeskus"]}
    conn = get conn, redirected_to(conn)
    assert html_response(conn, 200) =~ ~r/Your taxi will arrive in \d+ minutes/
  end
end
