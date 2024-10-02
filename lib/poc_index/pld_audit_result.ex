defmodule PocIndex.PldAuditResult do
  use Ecto.Schema
  import Ecto.Changeset

  # Usando UUID
  @primary_key {:id, :binary_id, autogenerate: false}
  schema "pld_audit_results" do
    field :decision, :string
    belongs_to :pld_audit, PocIndex.PldAudit, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(pld_audit_result, attrs) do
    pld_audit_result
    |> cast(attrs, [:decision, :pld_audit_id])
    |> validate_required([:decision, :pld_audit_id])
  end
end
