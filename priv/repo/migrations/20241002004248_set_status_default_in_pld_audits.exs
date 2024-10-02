defmodule PocIndex.Repo.Migrations.SetStatusDefaultInPldAudits do
  use Ecto.Migration

  def change do
    alter table(:pld_audits) do
      modify :status, :string, default: "executed", null: false
    end
  end
end
