defmodule PocIndexWeb.Router do
  use PocIndexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PocIndexWeb do
    pipe_through :api
  end
end
