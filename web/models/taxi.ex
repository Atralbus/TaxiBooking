defmodule Exam1.Taxi do
  use Exam1.Web, :model

  schema "taxis" do
    field :username, :string
    field :location, :string
    field :status, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :location, :status])
  end
end
