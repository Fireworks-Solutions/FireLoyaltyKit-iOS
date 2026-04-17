# Framework API Rules — FireLoyaltyKit

## Public API Stability
- Once a `public` symbol is shipped, treat it as locked
- Deprecate with `@available(*, deprecated, renamed: "newName")` before removing
- Never change function signatures without a major version discussion
- Add new functionality via new methods, not by changing existing ones

## Framework Design
- Prefer protocols over concrete types in public API (easier to mock/test)
- Provide sensible defaults — consumer should need minimal setup
- Avoid `UIKit` in the framework's public interface where possible
- Design for Swift concurrency from the start (`async/await`, `Sendable`)

## Integration with T360 / HunzaApp
- This framework is consumed by apps on the Fireworks Digital App Store Connect account
- Do not embed Firebase SDK inside the framework — let the app add it via SPM
- ATT and privacy manifest compliance is the consumer app's responsibility
- IDFV / Keychain access: if added to the framework, make it opt-in via a config flag

## Versioning
- Follow semantic versioning: MAJOR.MINOR.PATCH
- Tag releases in git: `git tag -a v1.0.0 -m "Release 1.0.0"`
- Keep a CHANGELOG.md at the project root
