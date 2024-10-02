defmodule PocIndex.Repo.Migrations.AddPldAuditsTable do
  use Ecto.Migration

  def change do
    create table(:pld_audits, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :input_params, :jsonb, null: false, default: "{}"

      timestamps()
    end
  end
end
