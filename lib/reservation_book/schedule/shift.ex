defmodule ReservationBook.Schedule.Shift do
  use Ecto.Schema
  import Ecto.Changeset
  alias ReservationBook.Schedule.Shift
  alias ReservationBook.Schedule.Room


  schema "shifts" do
    field :day_of_week, :integer
    field :end_time, :time
    field :sites_reserved, :integer
    field :start_time, :time
    belongs_to :room, Room

    timestamps()
  end

  @doc false
  def changeset(%Shift{} = shift, attrs) do
    shift
    |> cast(attrs, [:day_of_week, :start_time, :end_time, :sites_reserved])
    |> validate_required([:day_of_week, :start_time, :end_time, :sites_reserved])
  end
end
