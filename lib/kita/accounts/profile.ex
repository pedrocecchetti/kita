defmodule Kita.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :date_of_birth, :date
    field :first_name, :string
    field :kita_name, :string
    field :last_name, :string
    field :profile_type, Ecto.Enum, values: [:kita, :person]
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:first_name, :last_name, :date_of_birth, :kita_name, :profile_type])
    |> validate_required([:first_name, :last_name, :profile_type])
    |> unique_constraint(:kita_name)
  end
end
