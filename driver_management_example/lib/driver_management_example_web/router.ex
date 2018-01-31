defmodule DriverManagementExampleWeb.Router do
  use DriverManagementExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  # Other scopes may use custom stacks.
  scope "/api", DriverManagementExampleWeb do
    pipe_through :api

    resources "/drivers", DriverController
  end

  scope "/", DriverManagementExampleWeb do
    pipe_through :api
    get "/", DriverController, :index
  get "/:id", DriverController, :show
  post "/", DriverController, :create
  put "/:id", DriverController, :update
  end
end
