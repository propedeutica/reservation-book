defmodule ReservationBookWeb.Router do
  use ReservationBookWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ReservationBookWeb do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController
    resources "/rooms", RoomController do
      resources "/shifts", ShiftController, only: [:index, :create, :update, :new]
    end
    resources "/shifts", ShiftController, except: [:create, :update, :new]
    get "/dashboard", DashboardController, :index
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReservationBookWeb do
  #   pipe_through :api
  # end
end
