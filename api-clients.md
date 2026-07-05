# FireLoyaltyKit — API Clients Reference

Inventory of every network client and endpoint used inside `FireLoyaltyKit/FireLoyaltyKit/Sources/`. All calls go through the single `NetworkClient` (`Sources/Network/NetworkClient.swift`), routed via 14 domain-specific client classes in `Sources/Clients/`.

## Conventions used below

- **Base URL**: resolved from `FireLoyaltyConfiguration.baseURL` + the relative path constant (defined in `Utills/URLContstants.swift`).
- **Transport**: all methods are completion-handler based (`onSuccess:`/`onError: (APIError) -> Void`), not async/await. `APIError` = `invalidURL | networkError | invalidResponse | decodingError`.
- **Params**: every client method takes a caller-built `[String: Any]` dict — there are no per-endpoint `Encodable` request structs in the framework. The "Params" column lists the meaningful keys sent by that call site (beyond the auto-injected ones below); when the method just forwards a caller dict verbatim, params are the app layer's responsibility.
- **Auto-injected on every request** (added by `NetworkClient`, not passed by the caller): `date`, `vc` (HMAC of `authTokenPass`+date), `sectoken` (access token), `custid`, `lang`, `os` ("iOS"), `deviceid`, `devicetype`, `devicemodel`, `app_version`, `build_number`, `mall`, `svc` (secret key), `pvc` (HMAC of custid+`pvcSeKey` when custid present).
- **POST** body is `application/x-www-form-urlencoded`; **GET** appends a query string. A 401 triggers an automatic token refresh (`api2/refreshToken.php`) and retry.

---

## 1. AuthClient

| Method | HTTP | Endpoint | Params (beyond auto-injected) | Response Model |
|---|---|---|---|---|
| `login(username:password:...)` | POST | `api2/login.php` | `email`, `password`, `type=""`, `pvc` | `LoginResponse` |
| `login(param:...)` | POST | `api2/login.php` | caller dict | `LoginResponse` |
| `sendOTPForLogin(param:...)` | POST | `api2/sendEmailOtp.php` | caller dict | `GeneralResponseModel` |
| `loginVerifyWithOTP(param:...)` | POST | `api2/loginEmail.php` | caller dict | `LoginResponse` |
| `sendOTPForLoginV4(param:...)` | POST | `api2/sendEmailOtp_v4.php` | caller dict | `GeneralResponseModel` |
| `loginVerifyWithOTPV4(param:...)` | POST | `api2/loginEmail_v4.php` | caller dict | `LoginResponse` |
| `checkMobileNumber(params:...)` | POST | `api2/checkMobileNumber.php` | caller dict | `VerifyLoginResponse` |
| `registerEmailCheckAPI(email:...)` | POST | `api2/checkEmailLogin.php` | `email` | `GeneralResponseModel` |
| `registerEmailCheckSSOAPI(email:...)` | POST | `api2/checkEmailSso.php` | `email` | `GeneralResponseModel` |
| `updateEmailCheckSSOAPI(email:...)` | POST | `api2/checkCognitoEmail.php` | `email` | `GeneralResponseModel` |
| `registerOTPAPI(params:...)` | POST | `api2/otp_register.php` | caller dict | `GeneralResponseModel` |
| `registerOTPVerificationAPI(params:...)` | POST | `api2/otp_register_verification.php` | caller dict | `GeneralResponseModel` |
| `registerEmailOTPAPI(params:...)` | POST | `api2/registerEmailOtp.php` | caller dict | `GeneralResponseModel` |
| `registerEmailOTPAPIV3(params:...)` | POST | `api2/registerEmailOtp_V3.php` | caller dict | `GeneralResponseModel` |
| `registerEmailOTPAPIV4(params:...)` | POST | `api2/registerEmailOtp_v4.php` | caller dict | `GeneralResponseModel` |
| `registerEmailOTPVerificationAPI(params:...)` | POST | `api2/registerEmailOtpVerify.php` | caller dict | `GeneralResponseModel` |
| `registerEmailOTPVerificationAPIV3(params:...)` | POST | `api2/registerEmailOtpVerify_V3.php` | caller dict | `GeneralResponseModel` |
| `registerEmailOTPVerificationAPIV4(params:...)` | POST | `api2/registerEmailOtpVerify_v4.php` | caller dict | `GeneralResponseModel` |
| `getSSOUserInfoAPI(params:...)` | POST | `api2/getCognitoUser.php` | caller dict | `MigrateUserResponse` |
| `register(param:...)` | POST | `api2/register.php` | caller dict | `RegisterResponse` |
| `registerV2(param:...)` | POST | `api2/registerV2.php` | caller dict | `LoginResponse` |
| `registerV3(param:...)` | POST | `api2/registerV3.php` | caller dict | `LoginResponse` |
| `registerV4(param:...)` | POST | `api2/register_v4.php` | caller dict | `LoginResponse` |
| `givePointsAPI(param:...)` | POST | `api2/giveRewardPoints.php` | caller dict | `GivePointsResponse` |
| `getPointDetailsAPI(param:...)` | POST | `api2/PointDetails.php` | caller dict | `GivePointsResponse` |
| `applyTouristAPI(param:...)` | POST | `api2/makeCustomerTourist.php` | caller dict | `GeneralResponseModel` |
| `addPushTokenAPI(token:...)` ⚠️ | POST | `api2/checkEmailLogin.php` (bug — reuses `registerEmailCheckAPI` path) | `token` | `GeneralResponseModel` |
| `changePasswordAPI(params:...)` | POST | `api2/changepass.php` | caller dict | `GeneralResponseModel` |
| `resetPasswordAPI(params:...)` | POST | `api/setPass.php` | caller dict | `LoginResponse` |
| `resetPasswordSendOTPAPI(params:...)` | POST | `e-commerce/api/forgetPass2.php` | caller dict | `GeneralResponseModel` |
| `resetPasswordVerifyOTPAPI(params:...)` | POST | `e-commerce/api/sms_reset_otp_verification.php` | caller dict | `GeneralResponseModel` |

`login`/`registerV2/V3/V4`/`loginVerifyWithOTP*` persist `accessToken`, `refreshToken`, `custid` to Keychain on success.

---

## 2. DashboardClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getDashboard(param:...)` | POST | `api2/dashboard.php` | `DashboardResponse` |
| `getUsefullLinks(param:...)` | POST | `api2/usefullinks.php` | `UsefulLinksResponse` |

---

## 3. EventsClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getEventsList(param:...)` | POST | `api2/webview_getEvents.php` | `EventsListResponse` |
| `getEventsDetails(param:...)` | POST | `api2/webview_eventDetails.php` | `EventDetailsResponse` |
| `getEventCategoriesList(param:...)` | POST | `api2/event_categories.php` | `CategoryResponse` |
| `getMyRsvpsList(param:...)` | POST | `api2/webview_getWallet.php` | `MyRsvpsListResponse` |
| `getMultiMyRSVPList(param:...)` | POST | `api2/webview_multiWalletList.php` | `MyRsvpsListResponse` |
| `getMyRsvpsDetails(param:...)` | POST | `api2/webview_getWalletDetails.php` | `MyRsvpDetailsResponse` |
| `callEventCheckOutApi(param:...)` | POST | `api2/event_checkout.php` | `EventCheckOutModel` |

---

## 4. EyePrescriptionClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getEyePrescriptionsList(param:...)` | POST | `api/getPrescriptionList.php` | `EyePrescriptionListResponse` |
| `getPrescriptionDetail(param:...)` | POST | `api/getPrescriptionDetails.php` | `EyePrescriptionDetailResponse` |

---

## 5. InitClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getMalls(param:...)` | POST | `api/malllist.php` | `MallsResponse` |
| `getAppBaseURL(completeURL:param:...)` ⚠️ | GET | arbitrary full URL passed by caller (only GET call in the framework) | `AppBaseURLResponse` |
| `getInAppAlertsApi(param:...)` | POST | `api2/member_alertList.php` | `MembersAlertResponse` |
| `getAppAlertsListApi(param:...)` | POST | `api2/alertList.php` | `MembersAlertResponse` |
| `addDeviceTokenApi(param:...)` | POST | `api2/addDeviceToken.php` | `GeneralResponseModel` |
| `showAlertsQRCodeApi(param:...)` | POST | `api/qr_get_message_image.php` | `GeneralResponseModel` |

---

## 6. MerchantClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getMerchantsList(parameters:...)` | POST | `api2/getDirectoryList.php` | `MerchantListResponse` |
| `getMerchantCategories(parameters:...)` | POST | `api2/merchant_categories.php` | `MerchantCategoryResponse` |
| `getMerchantDetails(parameters:...)` | POST | `api2/webview_aboutMerchant.php` | `MerchantDetailsResponse` |
| `getDirectoryFloorsList(parameters:...)` | POST | `api2/getDirectoryFloor.php` | `FloorsListResponse` |
| `getFacilityCategories(parameters:...)` | POST | `api2/facility_categories.php` | `CategoryResponse` |
| `getFacilityFloorsList(parameters:...)` | POST | `api2/getFacilityFloor.php` | `FloorsListResponse` |
| `getFacilitiesList(parameters:...)` | POST | `api2/getFacilities.php` | `FacilityListResponse` |
| `getFacilityDetails(parameters:...)` | POST | `api2/webview_aboutFacility.php` | `FacilityDetailsResponse` |

---

## 7. PrivilegesClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getPrivilegesDashboard(param:...)` | POST | `api2/privileges_dashboard.php` | `PrivilegesDashboardResponse` |
| `getPrivilegesRanksInfo(param:...)` | POST | `api2/getRankInfo.php` | `RanksInfoResponse` |

---

## 8. ProfileClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getProfile(param:...)` | POST | `api2/profile.php` | `ProfileModel` → returns `.profile` (`ProfileResult`) |
| `saveProfile(params:...)` | POST | `api2/updateProfile.php` | `GeneralResponseModel` |
| `getBranchList(param:...)` | POST | `api/getMerchantBranchList.php` | `MerchantBranchResponse` |

---

## 9. PromotionsClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getPromotionsList(parameters:...)` | POST | `api2/getNews.php` | `PromotionListResponse` |
| `getPromotionDetails(parameters:...)` | POST | `api2/getNewsDetails.php` | `PromotionDetailResponse` |
| `getArticlesList(parameters:...)` | POST | `api2/getArticle.php` | `ArticlesListResponse` |
| `getArticleDetails(parameters:...)` | POST | `api2/getArticleById.php` | `ArticleDetailResponse` |
| `getArticleCategory(parameters:...)` | POST | `api2/getArticleCategories.php` | `CategoryResponse` |
| `getNewsCategory(parameters:...)` | POST | `api2/getAllNewsCategory.php` | `CategoryResponse` |

---

## 10. RewardsClient (largest client — 22 methods)

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getRewardsList(param:...)` | POST | `api2/webview_getRewards.php` | `RewardsListResponse` |
| `getRewardsV2List(param:...)` | POST | `api2/webview_getRewardsV2.php` | `RewardsListResponse` |
| `searchRewardsList(param:...)` | POST | `api2/searchByRewards.php` | `RewardsListResponse` |
| `getNearByRewardsList(param:...)` | POST | `api2/nearby_rewards.php` | `RewardsListResponse` |
| `getRewardDetails(param:...)` | POST | `api2/webview_getDetails.php` | `RewardDetailsResponse` |
| `getRewardsCategoryList(param:...)` | POST | `api2/categories.php` | `CategoryResponse` |
| `getRewardsV2CategoryList(param:...)` | POST | `api2/categoriesV2.php` | `CategoryResponse` |
| `getSearchRewardMerchantsListAPI(param:...)` | POST | `api2/searchFilter.php` | `SearchAPIResponse` |
| `getNearByRewardsCategoryList(param:...)` | POST | `api2/categories_nearby.php` | `CategoryResponse` |
| `getRewardMerchantsList(param:...)` | POST | `api2/getDirectoryListReward.php` | `MerchantListResponse` |
| `getMyRewardsList(param:...)` | POST | `api2/webview_getWallet.php` | `MyRewardsListResponse` |
| `getMultiRewardsList(param:...)` | POST | `api2/webview_multiWalletList.php` | `MyRewardsListResponse` |
| `getMyRewardDetails(param:...)` | POST | `api2/webview_getWalletDetails.php` | `MyRewardDetailsResponse` |
| `callCheckOutApi(param:...)` | POST | `api2/checkout.php` | `CheckOutModel` |
| `getRewardTimerAPI(param:...)` | POST | `api2/timer_reward.php` | `TimerRewardResponse` |
| `getStampRewardsList(param:...)` | POST | `api2/get_stamp_rewards.php` | `DailyCheckInResponse` |
| `getCheckedInStampReward(param:...)` ⚠️ | POST | `api2/get_stamp_rewards.php` (bug — should call `stampRewardsCheckedInAPI`) | `GeneralResponseModel` |
| `callGiftCheckOutApi(param:...)` | POST | `api2/giftCheckout.php` | `CheckOutModel` |
| `callShippingPointsApi(param:...)` | POST | `api2/get_shipping_points.php` | `ShipPointsResponse` |
| `transferVoucher(param:...)` | POST | `api/transferVoucher.php` | `RewardsListResponse` |
| `getMerchantBranchList(param:...)` | POST | `api/getMerchantBranchList.php` | `MerchantBranchListResponse` |
| `useMerchantCouponAPI(param:...)` | POST | `api2/redeem_using_voucher_code.php` | `GeneralResponseModel` |

---

## 11. ScanReceiptClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `uploadeDirectReceiptAPI(param:...)` | POST | `api2/uploadReceiptDirect.php` | `GeneralResponseModel` |
| `uploadeManualReceiptAPI(param:...)` | POST | `api2/uploadReceipt.php` | `OcrResponse` |
| `addScannedReceiptAPI(param:...)` | POST | `api2/addReceipt.php` | `AddScanReceiptResponse` |
| `getScanMerchantBranchList(param:...)` | POST | `api/getMerchantBranchList.php` | `ScanReceiptBranchListResponse` |

---

## 12. SettingsClient (misc/settings — 16 methods)

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getStatesList(parameters:...)` | POST | `api/branch_states.php` | `StatesListResponse` |
| `getCountryList(parameters:...)` | POST | `api/countryList.php` | `CountryListResponse` |
| `getCountryCodesList(parameters:...)` | POST | `api/getCountryCodes.php` | `CountryCodesResponse` |
| `getDailyRewardsList(param:...)` | POST | `api2/get_daily_check_in_rewards.php` | `DailyCheckInResponse` |
| `getCheckedInDailyReward(param:...)` | POST | `api2/daily_check_in_rewards.php` | `GeneralResponseModel` |
| `getNotificationList(param:...)` | POST | `api/inbox_listing.php` | `NotificationListResponse` |
| `getPurchasedCountAPI(param:...)` | POST | `api2/purchased_count.php` | `PurchasedCountResponse` |
| `getSalutationAPI(param:...)` | POST | `api2/get_salutation.php` | `SalutationResponse` |
| `getSupportTicketTypeListAPI(param:...)` | POST | `api/support_type.php` | `SupportTicketListResponse` |
| `callNotificationActionAPI(param:...)` | POST | `api2/inbox_action.php` | `GeneralResponseModel` |
| `getReferralRewardAPI(param:...)` | POST | `api2/getReferralRewardData.php` | `InviteModel` |
| `sendFeedbackAPI(param:...)` | POST | `information/support_mailer.php` | `GeneralResponseModel` |
| `readAllNotifications(parameters:...)` | POST | `api2/clear_all_noti.php` | `GeneralResponseModel` |
| `deleteAccount(parameters:...)` | POST | `api/deleteCust.php` | `GeneralResponseModel` |
| `getAppThemeSettings(parameters:...)` | POST | `api/app_settings.php` | `AppConfigResponse` |
| `getContentDisplayInfo(parameters:...)` | POST | `api/content_display.php` | `ContentDisplayResponse` |

---

## 13. StoreLocatorClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getStoreLocatorFilters(param:...)` | POST | `api/store_locator_filter.php` | `StoreLocatorFilterResponse` |
| `getStoreLocatorResults(params:...)` | POST | `api/store_locator_result.php` | `StoreLocatorResultResponse` |

---

## 14. SupplementCardClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getSupplementCards(param:...)` | POST | `api/list_supplementary.php` | `SupplementaryListResponse` |
| `switchMember(param:...)` | POST | `api/autoLogin.php` | `LoginResponse` |
| `addSupplementary(params:...)` | POST | `api/add_supplementary.php` | `AddSupplementaryResponse` |

---

## 15. TransactionHistoryClient

| Method | HTTP | Endpoint | Response Model |
|---|---|---|---|
| `getTransactionList(parameters:...)` | POST | `api2/merchantTransactionHistoryNew.php` | `TransactionHistoryResponse` |
| `getTransactionListDetails(parameters:...)` | POST | `api2/merchantTransactionHistorySingle.php` | `THdetailsResponse` |
| `archiveTransactionItem(parameters:...)` | POST | `api2/archiveTransaction.php` | `GeneralResponseModel` |
| `payWithPointsAPI(parameters:...)` | POST | `api/updatePayableByPoints.php` | `GeneralResponseModel` |
| `releasePointsAPI(parameters:...)` | POST | `api2/releasePoints.php` | `GeneralResponseModel` |

---

## Endpoints declared in `URLContstants.swift` but not called by any client

Possibly app-layer-only or dead: `baseConfigAPI`, `LoginWithOTPAPI`, `loginWithPhoneAPI`, `Migrating_Reset_Password`, `Existing_USER_Check`, `migrating_Member_API`, `setPasswordAPI`, `SCANNED_DETAIL_URL`, `stampRewardsCheckedInAPI`, `aboutUsAPI`, `getCitiesAPI`, `getRelatedBranchesAPI`, `getBranchesAPI`, `profileImageAPI`, `updateProfilePicAPI`, `setnotificationAPI`, `getNotificationAPI`, `getNotificationsAPI`.

## Known irregularities (⚠️ marked above)

1. `AuthClient.addPushTokenAPI` posts to the `checkEmailLogin.php` path instead of a dedicated push-token endpoint — looks like a copy/paste bug.
2. `RewardsClient.getCheckedInStampReward` posts to the stamp-rewards *list* endpoint instead of `stampRewardsCheckedInAPI`.
3. `getMerchantBranchList` (`api/getMerchantBranchList.php`) is called identically by three clients (`ProfileClient`, `RewardsClient`, `ScanReceiptClient`), each decoding into a different response model.
4. `getAppBaseURL` in `InitClient` is the only GET request in the framework; every other endpoint is POST.
