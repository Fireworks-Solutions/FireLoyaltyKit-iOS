# FireLoyaltyKit — URLContstants.swift API Reference

Full list of API endpoint constants defined in `FireLoyaltyKit/FireLoyaltyKit/Sources/Utills/URLContstants.swift`, grouped by their `// MARK:` section in file order.

| Constant | Endpoint Path |
|---|---|
| **ON BOARDING** | |
| `baseConfigAPI` | `api/baseConfig.php?` |
| `AlertsAPI` | `api2/alertList.php?` |
| **AUTH** | |
| `REFRESH_TOKEN_API` | `api2/refreshToken.php?` |
| **REGISTER** | |
| `registerV2API` | `api2/registerV2.php?` |
| `registerEmailCheckAPI` | `api2/checkEmailLogin.php?` |
| `loginAPI` | `api2/login.php?` |
| `checkPhoneNumberAPI` | `api2/checkMobileNumber.php?` |
| `loginWithPhoneAPI` | `api2/loginOtp.php?` |
| `LoginWithOTPAPI` | `api2/loginV2.php?` |
| `registerAPI` | `api2/register.php?` |
| `otpRegisterAPI` | `api2/otp_register.php?` |
| `otpRegisterVerificationAPI` | `api2/otp_register_verification.php?` |
| `giveRewardsPoints` | `api2/giveRewardPoints.php?` |
| `getPointDetailsPI` | `api2/PointDetails.php?` |
| `loginWithEmailAPI` | `api2/sendEmailOtp.php?` |
| `LoginWithEmailOTPVerifyAPI` | `api2/loginEmail.php?` |
| `loginWithEmailAPI_v4` | `api2/sendEmailOtp_v4.php?` |
| `LoginWithEmailOTPVerifyAPI_v4` | `api2/loginEmail_v4.php?` |
| `registerWithEmailSendOTPAPI_V3` | `api2/registerEmailOtp_V3.php?` |
| `registerV3API` | `api2/registerV3.php?` |
| `registerWithEmailVerifyOTPAPI_V3` | `api2/registerEmailOtpVerify_V3.php?` |
| `registerWithEmailSendOTPAPI` | `api2/registerEmailOtp.php?` |
| `registerWithEmailVerifyOTPAPI` | `api2/registerEmailOtpVerify.php?` |
| `changePasswordAPI` | `api2/changepass.php?` |
| `ResetPasswordAPI` | `api/setPass.php?` |
| `resetPasswordVerifyOTPAPI` | `e-commerce/api/sms_reset_otp_verification.php?` |
| `resetPasswordSendOTPAPI` | `e-commerce/api/forgetPass2.php?` |
| `getSSOUserInfoAPI` (SSO migration) | `api2/getCognitoUser.php?` |
| `checkSSOEmailExistAPI` (SSO migration) | `api2/checkCognitoEmail.php?` |
| `checkEmailSSOAPI` | `api2/checkEmailSso.php?` |
| `registerWithEmailSendOTPAPI_V4` | `api2/registerEmailOtp_v4.php?` |
| `registerWithEmailVerifyOTPAPI_V4` | `api2/registerEmailOtpVerify_v4.php?` |
| `registerV4API` | `api2/register_v4.php?` |
| **DASHBOARD/HOME** | |
| `dashboardAPI` | `api2/dashboard.php?` |
| `usefullLinkAPI` | `api2/usefullinks.php?` |
| `MallsAPI` | `api/malllist.php?` |
| `MEMBERS_LIST_API` | `api2/member_alertList.php?` |
| `GET_PURCHASED_COUNT_API` | `api2/purchased_count.php?` |
| **PROFILE** | |
| `GET_PROFILE` | `api2/profile.php?` |
| `UPDATE_PROFILE` | `api2/updateProfile.php?` |
| `profileImageAPI` | `api2/getProfileImage.php` |
| `updateProfilePicAPI` | `api2/uploadProfilePic.php?` |
| `getSaluationAPI` | `api2/get_salutation.php?` |
| `getMerchantBranchList` | `api/getMerchantBranchList.php` |
| **NOTIFICATIONS** | |
| `deviceTokenAPI` | `api2/addDeviceToken.php?` |
| `getNotificationAPI` | `api2/getnoti.php?` |
| `setnotificationAPI` | `api2/savenoti.php?` |
| `getNotificationsAPI` | `api2/getNotifications.php?` |
| `getInboxAPI` | `api/inbox_listing.php?` |
| `inboxActionAPI` | `api2/inbox_action.php?` |
| `readAllNotificationsAPI` | `api2/clear_all_noti.php?` |
| **PRIVILEGES** | |
| `PRIVILEGES_DASHBOARD` | `api2/privileges_dashboard.php?` |
| `PRIVILEGES_RANKS_INFO` | `api2/getRankInfo.php?` |
| **REWARDS** | |
| `rewardsListAPI` | `api2/webview_getRewards.php?` |
| `SearchRewardsAPI` | `api2/searchByRewards.php?` |
| `rewardsListV2API` | `api2/webview_getRewardsV2.php?` |
| `rewardDetailsAPI` | `api2/webview_getDetails.php?` |
| `checkOutApi` | `api2/checkout.php?` |
| `rewardCategoriesV2` | `api2/categoriesV2.php?` |
| `rewardTimerAPI` | `api2/timer_reward.php?` |
| `transferVoucher` | `api/transferVoucher.php?` |
| `redeemMerchantCouponVoucher` | `api2/redeem_using_voucher_code.php?` |
| **Gift redemption** | |
| `get_shipping_points` | `api2/get_shipping_points.php?` |
| `gift_CheckOut` | `api2/giftCheckout.php?` |
| **My REWARDS** | |
| `myRewardsListAPI` | `api2/webview_getWallet.php?` |
| `MultiRewardsListAPI` | `api2/webview_multiWalletList.php?` |
| `myRewardDetailsAPI` | `api2/webview_getWalletDetails.php?` |
| `NearByRewards` | `api2/nearby_rewards.php?` |
| `NearByRewardsCategories` | `api2/categories_nearby.php?` |
| `getRewardMerchantsAPI` | `api2/getDirectoryListReward.php?` |
| `getSearchFilterAPI` | `api2/searchFilter.php?` |
| **EVENTS** | |
| `eventsAPI` | `api2/webview_getEvents.php?` |
| `eventsCategoriesAPI` | `api2/event_categories.php?` |
| `eventDetailsAPI` | `api2/webview_eventDetails.php?` |
| `RSVPListAPI` | `api2/webview_getWallet.php?` |
| `RSVPDetailsAPI` | `api2/webview_getWalletDetails.php?` |
| `RSVPMultiListAPI` | `api2/webview_multiWalletList.php?` |
| `eventCheckOutAPI` | `api2/event_checkout.php?` |
| **PROMOTIONS** | |
| `promotionsListAPI` | `api2/getNews.php?` |
| `promotionDetailsAPI` | `api2/getNewsDetails.php?` |
| `newsCategoryDetailsAPI` | `api2/getAllNewsCategory.php?` |
| **ARTICLES** | |
| `articlesListAPI` | `api2/getArticle.php?` |
| `articleDetailsAPI` | `api2/getArticleById.php?` |
| `articleCategoriesAPI` | `api2/getArticleCategories.php?` |
| **DIRECTORY** | |
| `getDirectoryAPI` | `api2/getDirectoryList.php?` |
| `getMerchantDetail` | `api2/webview_aboutMerchant.php?` |
| `getMerchantCategories` | `api2/merchant_categories.php?` |
| `getCategoryAPI` | `api2/categories.php?` |
| `getBranchesAPI` | `api2/webview_getBranches.php?` |
| `getDirectoryFloorsList` | `api2/getDirectoryFloor.php?` |
| **FACILITIES** | |
| `facility_categories_Api` | `api2/facility_categories.php?` |
| `facility_get_Floor_Api` | `api2/getFacilityFloor.php?` |
| `facility_Details_Api` | `api2/webview_aboutFacility.php?` |
| `getFacilitiesList_Api` | `api2/getFacilities.php?` |
| **TRANSACATIONS** | |
| `check_Referral_code_API` | `api/check_valid_referral.php?` |
| `Release_Points_API` | `api2/releasePoints.php?` |
| `transactionHistoryAPI` | `api2/merchantTransactionHistoryNew.php?` |
| `transactionHistoryDetailsAPI` | `api2/merchantTransactionHistorySingle.php?` |
| `archiveTransactionAPI` | `api2/archiveTransaction.php?` |
| `PAY_WITH_POINTS_API` | `api/updatePayableByPoints.php?` |
| **MIGRATE USER** | |
| `migrating_Member_API` | `api2/getMigratedUserData.php?` |
| `Existing_USER_Check` | `api2/checkMigrateExist.php?` |
| `Migrating_Reset_Password` | `migration_resetpass_email_api.php?` |
| `setPasswordAPI` | `api2/setPass.php?` |
| **DELETE ACCOUNT** | |
| `Delete_account_api` | `api/deleteCust.php?` |
| **COUPON SCANNING** | |
| `SCANNED_DETAIL_URL` | `ecom/useCoupon.php?` |
| `uploadDirectReceiptAPI` | `api2/uploadReceiptDirect.php?` |
| `uploadReceiptAPI` | `api2/uploadReceipt.php?` |
| `AddScanReceiptAPI` | `api2/addReceipt.php?` |
| **Daily check** | |
| `dailyCheckListAPI` | `api2/get_daily_check_in_rewards.php?` |
| `dailyCheckedInAPI` | `api2/daily_check_in_rewards.php?` |
| **Stamp Rewards** | |
| `stampRewardsListAPI` | `api2/get_stamp_rewards.php?` |
| `stampRewardsCheckedInAPI` | `api2/stamp_rewards.php?` |
| `applytTourist_API` | `api2/makeCustomerTourist.php?` |
| **App Settings** | |
| `getAppSettingsAPI` | `api/app_settings.php?` |
| `getContentDisplayAPI` | `api/content_display.php?` |
| **Country and States APIS** | |
| `getCountryListAPI` | `api/countryList.php?` |
| `getCountryCodesListAPI` | `api/getCountryCodes.php?` |
| `getBranchStatesAPI` | `api/branch_states.php?` |
| `getCitiesAPI` | `api/branch_city.php?` |
| `getRelatedBranchesAPI` | `api/getBranches.php?` |
| **Feedback** | |
| `supportAPI` | `information/support_mailer.php?` |
| `supportTicketListAPI` | `api/support_type.php?` |
| `referralRewardAPI` | `api2/getReferralRewardData.php?` |
| `aboutUsAPI` | `api/webview_aboutus.php?` |
| **DEEPLINKING** | |
| `deepLinkQrcodeAPI` | `api/qr_get_message_image.php?` |
| **Supplementary Card** | |
| `getSupplementaryCards` | `api/list_supplementary.php?` |
| `addSupplementaryCard` | `api/add_supplementary.php?` |
| `switchMember` | `api/autoLogin.php?` |
| **Eye Prescription** | |
| `getPrescriptionsList` | `api/getPrescriptionList.php?` |
| `getPrescriptionDetail` | `api/getPrescriptionDetails.php?` |
| **STORE LOCATOR** | |
| `getStoreLocatorFilters` | `api/store_locator_filter.php` |
| `getStoreLocatorResults` | `api/store_locator_result.php?` |

**Total: 119 endpoint constants** across 27 sections.

> Note: full base URL is `FireLoyaltyConfiguration.baseURL` + the path above. For which client/method calls each endpoint, see `api-clients.md`.
