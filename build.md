---
description: Build FireLoyaltyKit framework (Debug or Release)
---

Build the FireLoyaltyKit framework using xcodebuild.

Configuration: $ARGUMENTS (default: Debug)

!`xcodebuild -workspace FireLoyaltyKit.xcworkspace -scheme FireLoyaltyKit -configuration ${ARGUMENTS:-Debug} build 2>&1 | tail -30`

Report:
1. Whether the build succeeded or failed
2. Any warnings worth addressing
3. Next steps if there are errors
