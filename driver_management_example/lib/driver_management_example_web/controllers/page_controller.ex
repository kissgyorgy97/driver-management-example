defmodule DriverManagementExampleWeb.PageController do
  use DriverManagementExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
