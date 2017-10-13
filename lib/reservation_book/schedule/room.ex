defmodule ReservationBook.Schedule.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias ReservationBook.Schedule.Room


  schema "rooms" do
    field :capacity, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Room{} = room, attrs) do
    room
    |> cast(attrs, [:name, :capacity])
    |> validate_required([:name, :capacity])
    |> unique_constraint(:name)
  end
end
