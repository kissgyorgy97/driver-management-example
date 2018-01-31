defmodule DriverManagementExample.Management.Driver do
  use Ecto.Schema
  import Ecto.Changeset
  alias DriverManagementExample.Management.Driver


  schema "drivers" do
    field :email, :string, unique: true
    field :name, :string
    field :phone_num, :string, unique: true
    field :plate, :string

    timestamps()
  end

  @doc false
  def changeset(%Driver{} = driver, attrs) do
    driver
    |> cast(attrs, [:name, :email, :phone_num, :plate])
    |> validate_required([:name, :email, :phone_num, :plate])
  end
end
