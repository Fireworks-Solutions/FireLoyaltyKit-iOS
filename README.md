# FireLoyaltyKit

iOS framework for the **Fireworks Loyalty** platform, built by **Fireworks Digital**.

---

## Requirements

| | Minimum |
|---|---|
| iOS | 15.0+ |
| Swift | 5.9+ |
| Xcode | 15.0+ |

---

## Installation

### Swift Package Manager (Recommended)

**Via Xcode:**
1. Open your project in Xcode
2. Go to **File → Add Package Dependencies**
3. Enter the repository URL:
   ```
   https://github.com/Fireworks-Solutions/FireLoyaltyKit-iOS.git
   ```
4. Select version **2.0.0** or **Up to Next Major**
5. Click **Add Package**
6. Select `FireLoyaltyKit` and add to your target

**Via `Package.swift`:**
```swift
dependencies: [
    .package(url: "https://github.com/Fireworks-Solutions/FireLoyaltyKit-iOS.git", from: "2.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: ["FireLoyaltyKit"]
    )
]
```

---

## Setup

Import and configure the framework once at app launch (e.g. `AppDelegate` or `@main`):

```swift
import FireLoyaltyKit

FireworksLoyaltyKit.configure(with: FireLoyaltyConfiguration(
    baseURL: URL(string: "https://your-api-base-url.com/")!,
    deviceId: UIDevice.current.identifierForVendor?.uuidString ?? "",
    deviceModel: UIDevice.current.model,
    deviceType: "iPhone",
    version: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0",
    buildNumber: Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1",
    lang: "en",
    enableDebug: true
))
```

---

## Usage

### Authentication

```swift
import FireLoyaltyKit

let auth = AuthClient()

// Login
auth.login(params: ["email": "user@example.com", "password": "secret"]) { response in
    print("Login success:", response)
} onError: { error in
    print("Login error:", error)
}
```

### Profile

```swift
let profile = ProfileClient()

profile.getProfile(param: [:]) { result in
    print("Profile:", result)
} onError: { error in
    print("Error:", error)
}
```

### Rewards

```swift
let rewards = RewardsClient()

rewards.getRewardsList(params: [:]) { list in
    print("Rewards:", list)
} onError: { error in
    print("Error:", error)
}
```

### Dashboard

```swift
let dashboard = DashboardClient()

dashboard.getDashboard(param: [:]) { data in
    print("Dashboard:", data)
} onError: { error in
    print("Error:", error)
}
```

---

## Available Clients

| Client | Description |
|---|---|
| `AuthClient` | Login, register, OTP, password reset |
| `ProfileClient` | Fetch and update user profile |
| `DashboardClient` | Dashboard data and useful links |
| `InitClient` | Malls, alerts, app base URL |
| `RewardsClient` | Rewards list, details, checkout, stamps |
| `EventsClient` | Events, RSVPs, checkout |
| `PromotionsClient` | Promotions, articles, categories |
| `MerchantClient` | Merchants, branches, categories |
| `SettingsClient` | Countries, states, notifications, support |
| `TransactionHistoryClient` | Transaction history and details |
| `PrivilegesClient` | Privileges dashboard and ranks |
| `SupplementaryCardClient` | Supplementary cards management |

---

## Keychain Storage

FireLoyaltyKit automatically manages secure token storage via Keychain. You can access it directly if needed:

```swift
// Save
KeychainHelper.shared.save("value", forKey: KeychainKeys.accessToken)

// Read
let token = KeychainHelper.shared.read(KeychainKeys.accessToken)

// Delete
KeychainHelper.shared.delete(KeychainKeys.accessToken)

// Clear all
KeychainHelper.shared.clearAll()
```

---

## Debug Logging

Enable `enableDebug: true` in `FireLoyaltyConfiguration` to log all API requests and responses. Retrieve logs at any time:

```swift
let logs = AppUtills.getLog()
for log in logs {
    print(log.apiName, log.responseCode)
}
```

---

## License

Copyright © 2025 Fireworks Digital. All rights reserved.
