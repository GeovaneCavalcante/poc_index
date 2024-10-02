defmodule PocIndex.PldAnalysisRequest do
  use Ecto.Schema
  import Ecto.Changeset

  # Usando UUID
  @primary_key {:id, :binary_id, autogenerate: false}
  schema "pld_analysis_request" do
    field :input_params, :map, default: %{}
    belongs_to :pld_audit, PocIndex.PldAudit, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(pld_analysis_request, attrs) do
    pld_analysis_request
    |> cast(attrs, [:input_params, :pld_audit_id])
    |> validate_required([:input_params, :pld_audit_id])
  end
end
