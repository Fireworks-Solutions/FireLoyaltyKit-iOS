# FireLoyaltyKit

iOS framework built under the **Fireworks Digital** umbrella for the **T360 by Tropicana** loyalty & rewards app.

## Project Overview

- **Type:** iOS Framework (`.framework`)
- **Xcode project:** `FireLoyaltyKit.xcodeproj`
- **Workspace:** `FireLoyaltyKit.xcworkspace`
- **Scheme:** `FireLoyaltyKit`
- **Product:** `FireLoyaltyKit.framework`
- **Swift version:** Swift 5.x (Xcode 16.3)
- **Min deployment:** iOS 15.0

## Key Commands

```bash
# Build the framework
xcodebuild -workspace FireLoyaltyKit.xcworkspace -scheme FireLoyaltyKit -configuration Debug build

# Run tests
xcodebuild -workspace FireLoyaltyKit.xcworkspace -scheme FireLoyaltyKit -configuration Debug test

# Archive (Release)
xcodebuild -workspace FireLoyaltyKit.xcworkspace -scheme FireLoyaltyKit -configuration Release archive

# Clean build folder
xcodebuild -workspace FireLoyaltyKit.xcworkspace -scheme FireLoyaltyKit clean
```

## Architecture

- Framework target: `FireLoyaltyKit`
- Sources live under `FireLoyaltyKit/` (file-system synchronized group)
- No third-party dependencies in the framework itself (SPM packages added at app level)
- Public API surface must be explicitly marked `public` — nothing is `public` by default in a framework

## Code Style

- Language: Swift 5.x, strict concurrency preferred
- Access control: `public` for API surface, `internal` for impl details, `private` for local scope
- Naming: `UpperCamelCase` for types, `lowerCamelCase` for functions/properties
- Async: prefer `async/await` over completion handlers for new code
- No force-unwrap (`!`) in production code — use `guard let` or `if let`
- Use `// MARK: -` section headers to organize files
- Doc comments (`///`) required on all `public` symbols

## Prohibited

- No `print()` for production logging — use `os.log` or a Logger wrapper
- No hardcoded strings for API keys/secrets — use environment config or Remote Config
- No `UIKit` imports at the framework layer unless strictly necessary — keep it modular
- No breaking changes to public API without a version bump discussion

## Testing

- XCTest for unit tests
- Place test files under `FireLoyaltyKitTests/`
- Mock network calls — do not make real network requests in tests
- Run tests before every PR

## Integration Notes

- Integrated into **T360 by Tropicana** app via Fireworks Digital App Store Connect account
- Firebase/Crashlytics added via SPM at the consumer app level, not inside this framework
- IDFV stored in Keychain for device identification (handled at app layer)
- ATT compliance managed at the app layer — framework must not call `requestTrackingAuthorization`

## SPM / Dependencies

- This framework itself has **no SPM dependencies**
- If a dependency is needed, discuss before adding — keep the framework lightweight
- Consumer apps add Firebase, ML Kit, Microsoft Clarity etc. via their own Package.swift / SPM config

## CI/CD

- Fastlane used for the parent T360 / HunzaApp projects (Fireworks Digital account)
- For this framework: build + test via Xcode Cloud or local `xcodebuild` commands above
