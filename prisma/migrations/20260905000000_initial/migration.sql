-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PortingOrder" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "orderNumber" TEXT NOT NULL,
    "customerReference" TEXT NOT NULL,
    "gainingCarrier" TEXT NOT NULL,
    "losingCarrier" TEXT NOT NULL,
    "requestedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PortingOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PortingNumber" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "telephoneNumber" TEXT NOT NULL,
    "numberType" TEXT NOT NULL,
    "serviceAddress" TEXT NOT NULL,
    "accountReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PortingNumber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuthorizationLetter" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "signedBy" TEXT NOT NULL,
    "signedAt" TIMESTAMP(3) NOT NULL,
    "customerName" TEXT NOT NULL,
    "scope" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AuthorizationLetter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerServiceRecord" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "carrier" TEXT NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "billingName" TEXT NOT NULL,
    "serviceAddress" TEXT NOT NULL,
    "extractedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomerServiceRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CarrierSubmission" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "submittedAt" TIMESTAMP(3) NOT NULL,
    "carrier" TEXT NOT NULL,
    "requestReference" TEXT NOT NULL,
    "payloadReference" TEXT NOT NULL,
    "receipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CarrierSubmission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CarrierRejection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "carrierSubmissionId" TEXT NOT NULL,
    "receivedAt" TIMESTAMP(3) NOT NULL,
    "rejectionCode" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "responseDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CarrierRejection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FirmOrderCommitment" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "confirmedAt" TIMESTAMP(3) NOT NULL,
    "activationAt" TIMESTAMP(3) NOT NULL,
    "carrier" TEXT NOT NULL,
    "confirmationReference" TEXT NOT NULL,
    "timezone" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FirmOrderCommitment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PortActivation" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "portingNumberId" TEXT NOT NULL,
    "activatedAt" TIMESTAMP(3) NOT NULL,
    "routingEvidence" TEXT NOT NULL,
    "serviceTest" TEXT NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PortActivation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PortingException" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "portingNumberId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "issue" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PortingException_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "portingOrderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "PortingOrder_createdAt_idx" ON "PortingOrder"("createdAt");

-- CreateIndex
CREATE INDEX "PortingNumber_createdAt_idx" ON "PortingNumber"("createdAt");

-- CreateIndex
CREATE INDEX "PortingNumber_portingOrderId_idx" ON "PortingNumber"("portingOrderId");

-- CreateIndex
CREATE INDEX "AuthorizationLetter_createdAt_idx" ON "AuthorizationLetter"("createdAt");

-- CreateIndex
CREATE INDEX "AuthorizationLetter_portingOrderId_idx" ON "AuthorizationLetter"("portingOrderId");

-- CreateIndex
CREATE INDEX "CustomerServiceRecord_createdAt_idx" ON "CustomerServiceRecord"("createdAt");

-- CreateIndex
CREATE INDEX "CustomerServiceRecord_portingOrderId_idx" ON "CustomerServiceRecord"("portingOrderId");

-- CreateIndex
CREATE INDEX "CarrierSubmission_createdAt_idx" ON "CarrierSubmission"("createdAt");

-- CreateIndex
CREATE INDEX "CarrierSubmission_portingOrderId_idx" ON "CarrierSubmission"("portingOrderId");

-- CreateIndex
CREATE INDEX "CarrierRejection_createdAt_idx" ON "CarrierRejection"("createdAt");

-- CreateIndex
CREATE INDEX "CarrierRejection_portingOrderId_idx" ON "CarrierRejection"("portingOrderId");

-- CreateIndex
CREATE INDEX "FirmOrderCommitment_createdAt_idx" ON "FirmOrderCommitment"("createdAt");

-- CreateIndex
CREATE INDEX "FirmOrderCommitment_portingOrderId_idx" ON "FirmOrderCommitment"("portingOrderId");

-- CreateIndex
CREATE INDEX "PortActivation_createdAt_idx" ON "PortActivation"("createdAt");

-- CreateIndex
CREATE INDEX "PortActivation_portingOrderId_idx" ON "PortActivation"("portingOrderId");

-- CreateIndex
CREATE INDEX "PortingException_createdAt_idx" ON "PortingException"("createdAt");

-- CreateIndex
CREATE INDEX "PortingException_portingOrderId_idx" ON "PortingException"("portingOrderId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_portingOrderId_idx" ON "OperationalTask"("portingOrderId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_portingOrderId_idx" ON "RuleVersion"("portingOrderId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_portingOrderId_idx" ON "DocumentRequirement"("portingOrderId");

-- AddForeignKey
ALTER TABLE "PortingNumber" ADD CONSTRAINT "PortingNumber_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuthorizationLetter" ADD CONSTRAINT "AuthorizationLetter_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerServiceRecord" ADD CONSTRAINT "CustomerServiceRecord_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarrierSubmission" ADD CONSTRAINT "CarrierSubmission_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarrierRejection" ADD CONSTRAINT "CarrierRejection_carrierSubmissionId_fkey" FOREIGN KEY ("carrierSubmissionId") REFERENCES "CarrierSubmission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarrierRejection" ADD CONSTRAINT "CarrierRejection_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FirmOrderCommitment" ADD CONSTRAINT "FirmOrderCommitment_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortActivation" ADD CONSTRAINT "PortActivation_portingNumberId_fkey" FOREIGN KEY ("portingNumberId") REFERENCES "PortingNumber"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortActivation" ADD CONSTRAINT "PortActivation_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortingException" ADD CONSTRAINT "PortingException_portingNumberId_fkey" FOREIGN KEY ("portingNumberId") REFERENCES "PortingNumber"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PortingException" ADD CONSTRAINT "PortingException_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_portingOrderId_fkey" FOREIGN KEY ("portingOrderId") REFERENCES "PortingOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

