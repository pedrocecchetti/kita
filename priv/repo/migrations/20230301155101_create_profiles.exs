defmodule Kita.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :first_name, :string
      add :last_name, :string
      add :date_of_birth, :date
      add :profile_type, :string

      timestamps()
    end

    alter table(:users) do
      add :profile_id, :id
    end

    create unique_index(:profiles, [:kita_name])
    create unique_index(:users, [:profile_id])
  end
end
