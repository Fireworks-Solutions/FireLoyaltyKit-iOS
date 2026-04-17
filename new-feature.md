---
description: Scaffold a new public feature/module in FireLoyaltyKit
---

Feature to add: $ARGUMENTS

Follow this workflow to add the feature to FireLoyaltyKit:

1. **Plan** — describe what files will be created/modified and why
2. **Protocol first** — define any protocols/interfaces before implementations
3. **Implementation** — write the Swift code with:
   - Proper `public`/`internal` access control
   - `///` doc comments on all public symbols
   - `// MARK: -` section headers
   - `async/await` for async work
   - No force-unwrap
4. **Tests** — write XCTest unit tests covering the happy path and at least one error case
5. **Summary** — list all files changed and what the consumer needs to do to use this feature

Current public sources:
!`find FireLoyaltyKit -name "*.swift" | sort`
