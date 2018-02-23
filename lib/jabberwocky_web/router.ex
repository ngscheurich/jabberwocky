defmodule JabberwockyWeb.Router do
  use JabberwockyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JabberwockyWeb do
    pipe_through :api
  end
end
