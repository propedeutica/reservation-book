defmodule ReservationBook.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ReservationBook.Accounts.User


  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :phone])
    |> validate_required([:first_name, :last_name, :email, :phone])
    |> unique_constraint(:email)
  end
end
