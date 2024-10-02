defmodule PocIndex.Repo.Migrations.AddStatusColumnToPldAudits do
  use Ecto.Migration

  def change do
    alter table(:pld_audits) do
      add :status, :string
    end
  end
end
