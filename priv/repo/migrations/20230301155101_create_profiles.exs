defmodule Kita.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :first_name, :string
      add :last_name, :string
      add :date_of_birth, :date
      add :profile_type, :string

      add :user_id, references(:users, on_delete: :nilify_all)

      timestamps()
    end

    create unique_index(:profiles, [:user_id])

  end
end
