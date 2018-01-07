defmodule Exam1.Allocation do
  use Exam1.Web, :model
  alias Exam1.{Booking,Taxi}

  schema "allocations" do
    field :status, :string
    belongs_to :booking, Booking
    belongs_to :taxi, Taxi
    
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:status])
    |> validate_required([:status])
  end
end

