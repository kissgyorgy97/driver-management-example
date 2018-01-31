defmodule DriverManagementExample.ManagementTest do
  use DriverManagementExample.DataCase

  alias DriverManagementExample.Management

  describe "drivers" do
    alias DriverManagementExample.Management.Driver

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def driver_fixture(attrs \\ %{}) do
      {:ok, driver} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_driver()

      driver
    end

    test "list_drivers/0 returns all drivers" do
      driver = driver_fixture()
      assert Management.list_drivers() == [driver]
    end

    test "get_driver!/1 returns the driver with given id" do
      driver = driver_fixture()
      assert Management.get_driver!(driver.id) == driver
    end

    test "create_driver/1 with valid data creates a driver" do
      assert {:ok, %Driver{} = driver} = Management.create_driver(@valid_attrs)
      assert driver.email == "some email"
      assert driver.name == "some name"
    end

    test "create_driver/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_driver(@invalid_attrs)
    end

    test "update_driver/2 with valid data updates the driver" do
      driver = driver_fixture()
      assert {:ok, driver} = Management.update_driver(driver, @update_attrs)
      assert %Driver{} = driver
      assert driver.email == "some updated email"
      assert driver.name == "some updated name"
    end

    test "update_driver/2 with invalid data returns error changeset" do
      driver = driver_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_driver(driver, @invalid_attrs)
      assert driver == Management.get_driver!(driver.id)
    end

    test "delete_driver/1 deletes the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{}} = Management.delete_driver(driver)
      assert_raise Ecto.NoResultsError, fn -> Management.get_driver!(driver.id) end
    end

    test "change_driver/1 returns a driver changeset" do
      driver = driver_fixture()
      assert %Ecto.Changeset{} = Management.change_driver(driver)
    end
  end
end
