defmodule KitaWeb.MeController do
  use KitaWeb, :controller

  def index(conn, _opts) do
    user_id = conn.assigns.current_user.id

    conn
    |> assign(:kitas, [%{name: "SHOW"}, %{name: "MANERO"}, %{name: "VIADO"}])
    |> render( "index.html")
  end


  def fetch_user_last_seen_kitas(user_id) do

  end

end
