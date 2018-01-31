defmodule DriverManagementExample.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :name, :string
      add :email, :string, unique: true
      add :phone_num, :string, unique: true
      add :plate, :string

      timestamps()
    end

  end
end
