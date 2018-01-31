defmodule DriverManagementExampleWeb.DriverView do
  use DriverManagementExampleWeb, :view
  alias DriverManagementExampleWeb.DriverView

  def render("index.json", %{drivers: drivers}) do
    %{data: render_many(drivers, DriverView, "driver.json")}
  end

  def render("show.json", %{driver: driver}) do
    %{data: render_one(driver, DriverView, "driver.json")}
  end

  def render("driver.json", %{driver: driver}) do
    %{id: driver.id,
      name: driver.name,
      email: driver.email,
      phone_num: driver.phone_num,
      plate: driver.plate}
  end
end
