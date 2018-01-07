defmodule Exam1.Router do
  use Exam1.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Exam1.Authentication, repo: Exam1.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Exam1 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    get "/bookings/summary", BookingController, :summary
    resources "/bookings", BookingController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Exam1 do
  #   pipe_through :api
  # end
end
