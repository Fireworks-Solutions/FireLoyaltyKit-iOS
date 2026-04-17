---
description: Run FireLoyaltyKit unit tests
---

Run the FireLoyaltyKit XCTest suite.

!`xcodebuild -workspace FireLoyaltyKit.xcworkspace -scheme FireLoyaltyKit -configuration Debug test 2>&1 | tail -40`

Report:
1. Number of tests passed / failed
2. Details on any failing tests with file + line
3. Suggestions to fix failing tests
