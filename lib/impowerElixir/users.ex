defmodule ImpowerElixir.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :mobile, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:token, :mobile])
    |> validate_required([:token, :mobile])
  end
end
