defmodule Exam1.Booking do
  use Exam1.Web, :model
  alias Exam1.User

  schema "bookings" do
    field :pickup_address, :string
    field :dropoff_address, :string
    field :status, :string, default: "open"
    belongs_to :user, User
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:pickup_address, :dropoff_address, :status])
    |> validate_difference
    |> validate_required([:pickup_address, :dropoff_address])
  end

  def validate_difference(changeset) do
    pickup = get_field(changeset, :pickup_address)
    dropoff = get_field(changeset, :dropoff_address)

    validate_difference(changeset, pickup, dropoff)
  end

  def validate_difference(changeset, pickup, dropoff) when pickup == dropoff do
    add_error(changeset, :difference, "pickup and dropoff cannot be same")
  end

  def validate_difference(changeset, _, _), do: changeset
end
