defmodule PocIndex.Repo.Migrations.AddPldAnalysisRequestTable do
  use Ecto.Migration

  def change do
    create table(:pld_analysis_request, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :input_params, :jsonb, null: false, default: "{}"
      add :pld_audit_id, references(:pld_audits, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
  end
end
