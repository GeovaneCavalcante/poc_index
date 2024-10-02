defmodule PocIndex.Repo do
  use Ecto.Repo,
    otp_app: :poc_index,
    adapter: Ecto.Adapters.Postgres
end
