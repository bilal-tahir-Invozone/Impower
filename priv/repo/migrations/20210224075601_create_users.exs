defmodule ImpowerElixir.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :token, :string
      add :mobile, :string

      timestamps()
    end

  end
end
