defmodule Kita.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :date_of_birth, :date
    field :first_name, :string
    field :last_name, :string
    field :profile_type, Ecto.Enum, values: [:kita, :person]

    timestamps()
  end

  def profile_type_options(), do: [:kita, :person]
  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:first_name, :last_name, :date_of_birth, :profile_type])
    |> validate_required([:first_name, :last_name, :profile_type])
    |> unique_constraint(:kita_name)
  end

  def update_names_changeset(profile, attrs) do
    profile
    |> cast(attrs, [:first_name, :last_name, :date_of_birth])
    |> validate_required([:first_name, :last_name])
  end
end
