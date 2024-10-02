defmodule PocIndex.Repo.Migrations.AddUniqueIndexToPldAuditsStatusExecutingAndDocument do
  use Ecto.Migration

  @disable_ddl_transaction true
  @disable_migration_lock true

  def up do
    execute """
    CREATE UNIQUE INDEX CONCURRENTLY index_pld_audits_on_status_executing_and_document
    ON pld_audits (status, (input_params->>'document'))
    WHERE status = 'executing'
    """
  end

  def down do
    execute "DROP INDEX CONCURRENTLY index_pld_audits_on_status_executing_and_document"
  end
end
