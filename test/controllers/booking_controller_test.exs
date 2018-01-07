defmodule Exam1.BookingControllerTest do
  use Exam1.ConnCase

  test "POST /bookings", %{conn: conn} do
    conn = post conn, "/bookings", %{booking: [pickup_address: "Liivi 2", dropoff_address: "Lõunakeskus"]}
    conn = get conn, redirected_to(conn)
    assert html_response(conn, 200) =~ ~r/Your taxi will arrive in \d+ minutes/
  end
end
