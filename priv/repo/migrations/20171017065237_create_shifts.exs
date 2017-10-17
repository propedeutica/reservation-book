defmodule ReservationBook.Repo.Migrations.CreateShifts do
  use Ecto.Migration

  def change do
    create table(:shifts) do
      add :day_of_week, :integer
      add :start_time, :time
      add :end_time, :time
      add :sites_reserved, :integer
      add :room_id, references(:rooms, on_delete: :nothing)

      timestamps()
    end

    create index(:shifts, [:room_id])
  end
end
