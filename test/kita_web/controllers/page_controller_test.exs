defmodule KitaWeb.PageControllerTest do
  use KitaWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Kita"
  end
end
