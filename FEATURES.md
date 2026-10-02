# Telecom Number Porting Operations

Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts.

## Implemented records

- **Porting Order**: name, order Number, customer Reference, gaining Carrier, losing Carrier, requested At, status.
- **Porting Number**: name, telephone Number, number Type, service Address, account Reference, status.
- **Authorization Letter**: title, signed By, signed At, customer Name, scope, evidence, status.
- **Customer Service Record**: title, carrier, account Number, billing Name, service Address, extracted At, status.
- **Carrier Submission**: title, submitted At, carrier, request Reference, payload Reference, receipt, status.
- **Carrier Rejection**: title, received At, rejection Code, reason, response Due At, status.
- **Firm Order Commitment**: title, confirmed At, activation At, carrier, confirmation Reference, timezone, status.
- **Port Activation**: title, activated At, routing Evidence, service Test, receipt, status.
- **Porting Exception**: title, observed At, issue, owner, action, due At, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Authorization extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- CSR and order comparison: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Carrier rejection classification: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Resubmission preparation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Activation checklist draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Customer status update draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Porting number batch validation: Identify E.164 format errors and duplicate numbers before carrier submission; ownership and portability are not inferred.
- Porting Order evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
