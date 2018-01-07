defmodule Exam1.User do
  use Exam1.Web, :model
  alias Exam1.Booking

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string
    has_many :bookings, Booking
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :password])
    |> validate_required([:name, :username, :password])
  end
end
