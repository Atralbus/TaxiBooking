defmodule Exam1.Router do
  use Exam1.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug Exam1.Authentication, repo: Exam1.Repo
  end

  pipeline :browser_auth do  
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end
  
  pipeline :require_login do
    plug Guardian.Plug.EnsureAuthenticated, handler: Exam1.SessionController    
    plug :guardian_current_user
  end

  def guardian_current_user(conn, _) do
    Plug.Conn.assign(conn, :current_user, Guardian.Plug.current_resource(conn))
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Exam1 do
    pipe_through :browser
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end
  
  scope "/", Exam1 do
    pipe_through [:browser, :browser_auth]
    get "/", PageController, :index
  end
  
  scope "/", Exam1 do
    pipe_through [:browser, :browser_auth, :require_login]
    resources "/users", UserController
    get "/bookings/summary", BookingController, :summary
    resources "/bookings", BookingController
  end  

  # Other scopes may use custom stacks.
  # scope "/api", Exam1 do
  #   pipe_through :api
  # end
end
