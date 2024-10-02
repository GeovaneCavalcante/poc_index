defmodule PocIndex.PldAuditUpdate do
  import Ecto.Query

  alias PocIndex.Repo
  alias PocIndex.PldAudit

  def update_in_batches do
    Repo.transaction(fn ->
      Repo.stream(from p in PldAudit, where: is_nil(p.status))
      |> Stream.chunk_every(1000)
      |> Enum.each(fn batch ->
        Enum.each(batch, fn audit ->
          Repo.update!(Ecto.Changeset.change(audit, status: "executed"))
        end)
      end)
    end)
  end
end
