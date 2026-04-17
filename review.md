---
description: Review current branch changes before merging
---

## Changed files

!`git diff --name-only main...HEAD 2>/dev/null || git diff --name-only HEAD~1`

## Diff

!`git diff main...HEAD 2>/dev/null || git diff HEAD~1`

Review the above changes for the FireLoyaltyKit iOS framework:

1. **Public API** — are all new public symbols documented with `///` doc comments?
2. **Access control** — nothing accidentally `public` that should be `internal`
3. **Swift best practices** — no force-unwrap, no `print()`, proper `async/await` usage
4. **Thread safety** — any shared mutable state? Should it use `@MainActor` or actors?
5. **Tests** — are new behaviours covered by unit tests?
6. **Breaking changes** — does anything change the existing public API surface?

Give specific, actionable feedback per file. Flag blocking issues vs suggestions.
