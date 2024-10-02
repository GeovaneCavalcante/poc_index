alias PocIndex.Repo
alias PocIndex.{PldAudit, PldAuditResult, PldAnalysisRequest}

pld_audit = %PldAudit{
  id: Ecto.UUID.generate(),
  input_params: %{"document" => "12345678901"}
}

pld_audit = Repo.insert!(pld_audit)

pld_audit_result = %PldAuditResult{
  id: Ecto.UUID.generate(),
  decision: "approved",
  pld_audit_id: pld_audit.id
}

Repo.insert!(pld_audit_result)

pld_analysis_request = %PldAnalysisRequest{
  id: Ecto.UUID.generate(),
  input_params: %{"document" => "98765432100"},
  pld_audit_id: pld_audit.id
}

Repo.insert!(pld_analysis_request)

IO.puts("Seeds inseridos com sucesso.")
