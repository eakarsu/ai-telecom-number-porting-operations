type FallbackRow = { entity: string; record: Record<string, unknown> };

const DOMAIN_ACTIONS: Record<string, string[]> = {
  "authorization-extraction": ["Verify the authorization letter covers every listed telephone number", "Confirm signer authority against the customer service record", "Retain the signed letter with the porting order before submission"],
  "csr-and-order-comparison": ["Reconcile account number, billing name, and service address between CSR and order", "Resolve mismatches with the losing carrier before resubmission", "Record the comparison outcome on the porting order"],
  "carrier-rejection-classification": ["Map each rejection code to its resubmission requirement", "Assign an owner and due date for every open rejection", "Attach corrected evidence before resubmitting to the carrier"],
  "resubmission-preparation": ["Check every previously rejected field has corrected evidence", "Confirm the requested port date is still valid", "Log the resubmission receipt against the original submission"],
  "activation-checklist-draft": ["Confirm the firm order commitment date and timezone", "Verify routing evidence and service test results are attached", "Notify the customer only after activation receipt is retained"],
  "customer-status-update-draft": ["Use only confirmed order status; do not promise unconfirmed dates", "Include the next milestone and its owner", "Retain the sent update with the porting order"],
  "evidence-completeness-review": ["List missing required documents per number", "Flag expired or unsigned evidence for renewal", "Block submission until required evidence is complete"],
  "operations-handoff-draft": ["Summarise open exceptions with owners and due dates", "Highlight overdue rejections and pending activations", "Confirm the receiving owner accepts each open item"],
};

export function deterministicFallback(workflow: { slug: string; title: string }, rows: FallbackRow[], input: Record<string, unknown>) {
  const counts = new Map<string, number>();
  for (const row of rows) counts.set(row.entity, (counts.get(row.entity) ?? 0) + 1);
  const citations = rows.map((row) => `${row.entity}:${String(row.record.id ?? "")}`);
  const findings = rows.length
    ? [...counts.entries()].map(([entity, count]) => `${entity}: ${count} record(s) supplied as evidence.`)
    : ["Records supplied: 0. No saved records were selected; this fallback uses entered fields only."];
  const entered = Object.entries(input).filter(([, v]) => String(v ?? "").trim() !== "").length;
  findings.push(`Entered fields with values: ${entered}; empty fields remain empty and are not inferred.`);
  return {
    status: "draft" as const,
    summary: `Deterministic fallback (not AI-generated) for ${workflow.title}: reviewed ${rows.length} own record(s) locally. No provider was called.`,
    findings,
    recommendations: DOMAIN_ACTIONS[workflow.slug] ?? ["Validate the supplied evidence", "Assign an accountable owner", "Retain approval and closure evidence"],
    citations,
    limitations: ["Deterministic local rules over own records only; aiGenerated is false.", "A qualified reviewer must validate source evidence before any carrier submission or customer commitment."],
    aiGenerated: false,
    provider: "deterministic-fallback",
  };
}
