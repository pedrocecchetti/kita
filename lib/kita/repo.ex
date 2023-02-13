defmodule Kita.Repo do
  use Ecto.Repo,
    otp_app: :kita,
    adapter: Ecto.Adapters.Postgres
end
