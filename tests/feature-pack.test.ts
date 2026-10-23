import { test } from "node:test";
import assert from "node:assert/strict";

// Provider keys are unset by the test runner; the fallback imports no provider code and works offline.
import { deterministicFallback } from "../src/lib/ai-fallback";

test("deterministic fallback is labelled aiGenerated:false over own records", () => {
  const out = deterministicFallback({ slug: "carrier-rejection-classification", title: "Carrier rejection classification" }, [{ entity: "CarrierRejection", record: { id: "r1" } }], { note: "" });
  assert.equal(out.aiGenerated, false);
  assert.equal(out.provider, "deterministic-fallback");
  assert.ok(out.citations.includes("CarrierRejection:r1"));
  assert.ok(out.recommendations.length >= 2);
});
test("deterministic fallback preserves the 0-records case", () => {
  const out = deterministicFallback({ slug: "activation-checklist-draft", title: "Activation checklist draft" }, [], {});
  assert.ok(out.findings.some((f) => f.includes("0")));
  assert.equal(out.aiGenerated, false);
});
