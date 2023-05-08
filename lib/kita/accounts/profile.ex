defmodule Kita.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  alias Kita.Accounts.User

  schema "profiles" do
    field :first_name, :string
    field :last_name, :string
    field :date_of_birth, :date
    field :profile_type, Ecto.Enum, values: [:kita, :person]

    belongs_to :user, User
    timestamps()
  end

  def profile_type_options(), do: [:kita, :person]
  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:first_name, :last_name, :date_of_birth, :profile_type])
    |> validate_required([:first_name, :last_name, :profile_type])
  end

  def update_names_changeset(profile, attrs) do
    profile
    |> cast(attrs, [:first_name, :last_name, :date_of_birth])
    |> validate_required([:first_name, :last_name])
  end
end
