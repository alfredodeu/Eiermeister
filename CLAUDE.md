<claude_instructions>
<objective>
Act systematically, safely, and without trial-and-error. Analyze first, plan, then execute minimal-invasive changes. Communicate with the user in standard German. Use externalized project knowledge from markdown files as a lightweight second brain instead of repeating large context in every session.
</objective>

<rules>
- Priority: 1. Correctness 2. Minimal changes 3. Protect existing functionality.
- No large refactoring, renaming, or architectural changes unless explicitly requested.
- Keep changes minimal and local.
- Read a maximum of 3 files simultaneously to manage context effectively.
- No trial-and-error or speculative implementation. Identify the root cause first.
- Start a new session for each distinct task instead of mixing unrelated work in one long chat.
- Keep this CLAUDE.md lean. Store detailed project context, rules, procedures, examples, and long notes in separate markdown files and reference them from here.
- Before long tasks or after major progress, compress/summarize the session and persist important facts into the project knowledge files.
- Prefer direct API-based integrations or local scripts over heavy connector/tool setups when they reduce recurring context overhead.
- Only enable external tool connections that are actually needed for the current task.
- Entra 365 API safety: NEVER execute mutating/write API calls against Entra 365 without explicit user approval.
- Database safety: Always create a backup before modifying databases: `cp <db> <db>.backup.$(date +%s)`. Restore on failure.
</rules>

<knowledge_loading>
- For project background and architecture, read `docs/context.md`.
- For coding conventions and permanent guardrails, read `docs/rules.md`.
- For recurring operational tasks and troubleshooting, read `docs/runbooks.md`.
- For architectural or process decisions, read `docs/decisions.md`.
- Only load the files relevant to the active task.
- If new durable knowledge emerges, persist it in one of these files instead of expanding this CLAUDE.md.
</knowledge_loading>

<workflow>
1. Analyze: Read only the relevant files and matching knowledge documents. Identify root cause and current logic.
2. Plan: Formulate a minimal fix strategy and specify exact target locations.
3. Verify: Use `pytest` for Python and `Pester` for PowerShell. Define manual steps/realistic examples if no tests exist.
4. Approve: Ask exactly "Soll ich diesen Plan so umsetzen?" and wait for approval.
5. Execute: Implement the approved fix only after confirmation.
6. Persist: Write newly discovered durable knowledge into the appropriate markdown file.
</workflow>

<working_principles>
- Prefer file-based or script-based processing for scraping, extraction, or larger transformations.
- Keep conversations task-scoped: one task, one session.
- Summarize long sessions and continue from compact context plus referenced knowledge files.
- Reusable process knowledge belongs in docs, not in transient chat context.
</working_principles>

<output_formats>
Use this exact format before making changes:

### Analyse & Plan
- **Files**: [Affected files]
- **Root Cause**: [Brief technical explanation]
- **Fix Strategy**: [Minimal change description]
- **Verification**: [Pytest / Pester / Manual steps]

**Soll ich diesen Plan so umsetzen?**

---
Use this exact format after making changes:

### Umsetzung & Prüfung
- **Changed**: [Files modified]
- **Action**: [What was logically changed]
- **Tested**: [Verification results]
- **Edge Cases**: [Remaining risks or open points]
</output_formats>
</claude_instructions>
