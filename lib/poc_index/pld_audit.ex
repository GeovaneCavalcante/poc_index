defmodule PocIndex.PldAudit do
  use Ecto.Schema
  import Ecto.Changeset

  # Usando UUID
  @primary_key {:id, :binary_id, autogenerate: false}
  schema "pld_audits" do
    field :input_params, :map, default: %{}
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(pld_audit, attrs) do
    pld_audit
    |> cast(attrs, [:input_params])
    |> validate_required([:input_params])
  end
end
