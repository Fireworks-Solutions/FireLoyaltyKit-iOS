# Swift Style Rules — FireLoyaltyKit

Apply these rules to all Swift files in this project.

## Access Control
- `public` — only for symbols that consumer apps need
- `internal` — default for implementation details (can omit keyword)
- `private`/`fileprivate` — restrict to the file/type

## Naming
- Types: `UpperCamelCase` (e.g. `LoyaltyAPIClient`, `RewardEndpoint`)
- Functions/properties: `lowerCamelCase`
- Async functions: suffix with nothing special — rely on `async throws` signature
- Boolean properties: prefix with `is`, `has`, `should`, `can`

## Documentation
- Every `public` symbol must have a `///` doc comment
- Use `/// - Parameter name: description` and `/// - Returns:` and `/// - Throws:`
- Internal/private code: inline `//` comments only where non-obvious

## Error Handling
- Define typed errors as `enum MyError: Error, LocalizedError`
- Always implement `errorDescription` on `LocalizedError`
- Never `try!` or `as!` in production code

## Async/Concurrency
- Prefer `async throws` over completion handlers
- Mark UI-touching code `@MainActor`
- Use `Task { }` at call sites, not inside library code
- Structured concurrency (`async let`, `TaskGroup`) over `DispatchQueue`

## No-nos
- No `print()` — use `os.log` with a subsystem of `com.fireworks.FireLoyaltyKit`
- No `UIApplication.shared` inside the framework (breaks extension targets)
- No hardcoded URLs or keys — accept via init parameters or configuration objects
- No `@objc` unless explicitly bridging to Objective-C consumer
