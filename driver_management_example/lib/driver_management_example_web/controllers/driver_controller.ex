defmodule DriverManagementExampleWeb.DriverController do
  use DriverManagementExampleWeb, :controller

  alias DriverManagementExample.Management
  alias DriverManagementExample.Management.Driver

  action_fallback DriverManagementExampleWeb.FallbackController

  def index(conn, _params) do
    drivers = Management.list_drivers()
    render(conn, "index.json", drivers: drivers)
  end

  

  def show(conn, %{"id" => id}) do
    driver = Management.get_driver!(id)
    render(conn, "show.json", driver: driver)
  end

  def create(conn, %{"driver" => driver_params}) do
    with {:ok, %Driver{} = driver} <- Management.create_driver(driver_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", driver_path(conn, :show, driver))
      |> render("show.json", driver: driver)
    end
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    driver = Management.get_driver!(id)

    with {:ok, %Driver{} = driver} <- Management.update_driver(driver, driver_params) do
      render(conn, "show.json", driver: driver)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = Management.get_driver!(id)
    with {:ok, %Driver{}} <- Management.delete_driver(driver) do
      send_resp(conn, :no_content, "")
    end
  end
end
