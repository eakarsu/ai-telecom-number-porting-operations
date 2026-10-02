export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-telecom-number-porting-operations",
  "title": "Telecom Number Porting Operations",
  "tagline": "Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts.",
    "entities": [
      "PortingOrder",
      "PortingNumber",
      "AuthorizationLetter"
    ],
    "workflows": [
      "authorization-extraction",
      "csr-and-order-comparison"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts.",
    "entities": [
      "CustomerServiceRecord",
      "CarrierSubmission",
      "CarrierRejection"
    ],
    "workflows": [
      "carrier-rejection-classification",
      "resubmission-preparation"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts.",
    "entities": [
      "FirmOrderCommitment",
      "PortActivation",
      "PortingException"
    ],
    "workflows": [
      "activation-checklist-draft",
      "customer-status-update-draft"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "PortingOrder": {
    "name": "PortingOrder",
    "label": "Porting Order",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "orderNumber",
        "kind": "string"
      },
      {
        "name": "customerReference",
        "kind": "string"
      },
      {
        "name": "gainingCarrier",
        "kind": "string"
      },
      {
        "name": "losingCarrier",
        "kind": "string"
      },
      {
        "name": "requestedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "PortingNumber": {
    "name": "PortingNumber",
    "label": "Porting Number",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "telephoneNumber",
        "kind": "string"
      },
      {
        "name": "numberType",
        "kind": "string"
      },
      {
        "name": "serviceAddress",
        "kind": "string"
      },
      {
        "name": "accountReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "AuthorizationLetter": {
    "name": "AuthorizationLetter",
    "label": "Authorization Letter",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "signedBy",
        "kind": "string"
      },
      {
        "name": "signedAt",
        "kind": "date"
      },
      {
        "name": "customerName",
        "kind": "string"
      },
      {
        "name": "scope",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "CustomerServiceRecord": {
    "name": "CustomerServiceRecord",
    "label": "Customer Service Record",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "carrier",
        "kind": "string"
      },
      {
        "name": "accountNumber",
        "kind": "string"
      },
      {
        "name": "billingName",
        "kind": "string"
      },
      {
        "name": "serviceAddress",
        "kind": "string"
      },
      {
        "name": "extractedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "CarrierSubmission": {
    "name": "CarrierSubmission",
    "label": "Carrier Submission",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "submittedAt",
        "kind": "date"
      },
      {
        "name": "carrier",
        "kind": "string"
      },
      {
        "name": "requestReference",
        "kind": "string"
      },
      {
        "name": "payloadReference",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "CarrierRejection": {
    "name": "CarrierRejection",
    "label": "Carrier Rejection",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "carrierSubmissionId",
        "kind": "string"
      },
      {
        "name": "receivedAt",
        "kind": "date"
      },
      {
        "name": "rejectionCode",
        "kind": "string"
      },
      {
        "name": "reason",
        "kind": "string"
      },
      {
        "name": "responseDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "FirmOrderCommitment": {
    "name": "FirmOrderCommitment",
    "label": "Firm Order Commitment",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "confirmedAt",
        "kind": "date"
      },
      {
        "name": "activationAt",
        "kind": "date"
      },
      {
        "name": "carrier",
        "kind": "string"
      },
      {
        "name": "confirmationReference",
        "kind": "string"
      },
      {
        "name": "timezone",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "PortActivation": {
    "name": "PortActivation",
    "label": "Port Activation",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "portingNumberId",
        "kind": "string"
      },
      {
        "name": "activatedAt",
        "kind": "date"
      },
      {
        "name": "routingEvidence",
        "kind": "string"
      },
      {
        "name": "serviceTest",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "PortingException": {
    "name": "PortingException",
    "label": "Porting Exception",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "portingNumberId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "issue",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "action",
        "kind": "string"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "portingOrderId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "authorization-extraction",
    "title": "Authorization extraction",
    "description": "Authorization extraction using selected porting order records and supplied evidence.",
    "prompt": "Authorization extraction for Telecom Number Porting Operations. Operational scope: Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts. Specific AI scope: Compare order documents and classify rejection reasons for operations review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "csr-and-order-comparison",
    "title": "CSR and order comparison",
    "description": "CSR and order comparison using selected porting order records and supplied evidence.",
    "prompt": "CSR and order comparison for Telecom Number Porting Operations. Operational scope: Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts. Specific AI scope: Compare order documents and classify rejection reasons for operations review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "carrier-rejection-classification",
    "title": "Carrier rejection classification",
    "description": "Carrier rejection classification using selected porting order records and supplied evidence.",
    "prompt": "Carrier rejection classification for Telecom Number Porting Operations. Operational scope: Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts. Specific AI scope: Compare order documents and classify rejection reasons for operations review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "resubmission-preparation",
    "title": "Resubmission preparation",
    "description": "Resubmission preparation using selected porting order records and supplied evidence.",
    "prompt": "Resubmission preparation for Telecom Number Porting Operations. Operational scope: Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts. Specific AI scope: Compare order documents and classify rejection reasons for operations review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "activation-checklist-draft",
    "title": "Activation checklist draft",
    "description": "Activation checklist draft using selected porting order records and supplied evidence.",
    "prompt": "Activation checklist draft for Telecom Number Porting Operations. Operational scope: Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts. Specific AI scope: Compare order documents and classify rejection reasons for operations review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "customer-status-update-draft",
    "title": "Customer status update draft",
    "description": "Customer status update draft using selected porting order records and supplied evidence.",
    "prompt": "Customer status update draft for Telecom Number Porting Operations. Operational scope: Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts. Specific AI scope: Compare order documents and classify rejection reasons for operations review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected porting order records and supplied evidence.",
    "prompt": "Evidence completeness review for Telecom Number Porting Operations. Operational scope: Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts. Specific AI scope: Compare order documents and classify rejection reasons for operations review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected porting order records and supplied evidence.",
    "prompt": "Operations handoff draft for Telecom Number Porting Operations. Operational scope: Manage letters of authorization, customer-service records, carrier rejections, confirmed port dates and completion receipts. Specific AI scope: Compare order documents and classify rejection reasons for operations review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
