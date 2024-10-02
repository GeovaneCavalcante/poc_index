defmodule PocIndex.Repo.Migrations.AddPldAuditResultsTable do
  use Ecto.Migration

  def change do
    create table(:pld_audit_results, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :decision, :string, size: 40
      add :pld_audit_id, references(:pld_audits, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
  end
end
