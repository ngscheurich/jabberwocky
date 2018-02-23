defmodule JabberwockyWeb.Router do
  use JabberwockyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JabberwockyWeb do
    pipe_through :api

    resources "/service_requests", ServiceRequestController, only: [:create, :show]
  end
end
