defmodule KitaWeb.PageController do
  use KitaWeb, :controller

  @pages [:index, :company, :team]

  for i <- @pages do
    def unquote(i)(conn, _param), do: render(conn, "#{unquote(i)}.html")
  end
end
