defmodule ImpowerElixir.Repo do
  use Ecto.Repo,
    otp_app: :impowerElixir,
    adapter: Ecto.Adapters.Postgres
end
