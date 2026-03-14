//
//  URLContstants.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 27/06/25.
//


struct URLContstants {
    
    //MARK: ON BOARDING
    static let baseConfigAPI = "api/baseConfig.php?"
    static let AlertsAPI = "api2/alertList.php?"
    
    
    //MARK: AUTH
    static let AUTH_TOKEN_PASS = "fireworks!12*SP#Se"          // For Authentication
    static let secretKeyPass = "ami3jf8anasnd1f"
    static let pvcSeKey = "dknne3je8k"
    
    static let REFRESH_TOKEN_API = "api2/refreshToken.php?"        // REFRESH TOKEN
     
    //MARK: REGISTER
    static let registerV2API = "api2/registerV2.php?"
    static let registerEmailCheckAPI = "api2/checkEmailLogin.php?" // Check email registered or not
    static let loginAPI = "api2/login.php?"                   // Login
    static let checkPhoneNumberAPI = "api2/checkMobileNumber.php?"   
    static let loginWithPhoneAPI = "api2/loginOtp.php?"
    static let LoginWithOTPAPI = "api2/loginV2.php?"
    static let registerAPI = "api2/register.php?" // -> During Registration
    static let otpRegisterAPI = "api2/otp_register.php?" // -> During Login
    static let otpRegisterVerificationAPI = "api2/otp_register_verification.php?"
    static let giveRewardsPoints = "api2/giveRewardPoints.php?"
    static let getPointDetailsPI = "api2/PointDetails.php?"
    
    static let loginWithEmailAPI = "api2/sendEmailOtp.php?"
    static let LoginWithEmailOTPVerifyAPI = "api2/loginEmail.php?"
    

    static let registerWithEmailSendOTPAPI_V3 = "api2/registerEmailOtp_V3.php?"
    static let registerV3API = "api2/registerV3.php?"
    static let registerWithEmailVerifyOTPAPI_V3 = "api2/registerEmailOtpVerify_V3.php?"
    
    static let registerWithEmailSendOTPAPI = "api2/registerEmailOtp.php?"
    static let registerWithEmailVerifyOTPAPI = "api2/registerEmailOtpVerify.php?"
    
    static let changePasswordAPI = "api2/changepass.php?"     // Passwords
    static let ResetPasswordAPI = "api/setPass.php?"
    
    static let resetPasswordVerifyOTPAPI = "e-commerce/api/sms_reset_otp_verification.php?"
    static let resetPasswordSendOTPAPI = "e-commerce/api/forgetPass2.php?"
    
    
    
    
    //MARK: DASHBOARD/HOME
    static let dashboardAPI = "api2/dashboard.php?"
    static let usefullLinkAPI = "api2/usefullinks.php?"
    static let MallsAPI = "api/malllist.php?"
    static let MEMBERS_LIST_API = "api2/member_alertList.php?"
    static let GET_PURCHASED_COUNT_API = "api2/purchased_count.php?"
    
    //MARK: PROFILE
    static let GET_PROFILE = "api2/profile.php?"
    static let UPDATE_PROFILE = "api2/updateProfile.php?"
    static let profileImageAPI = "api2/getProfileImage.php"
    static let updateProfilePicAPI = "api2/uploadProfilePic.php?"
    static let getSaluationAPI = "api2/get_salutation.php?"
    
    //MARK: NOTIFICATIONS
    static let deviceTokenAPI = "api2/addDeviceToken.php?"
    static let getNotificationAPI = "api2/getnoti.php?"
    static let setnotificationAPI = "api2/savenoti.php?"
    static let getNotificationsAPI = "api2/getNotifications.php?"
    static let getInboxAPI = "api/inbox_listing.php?"
    static let inboxActionAPI = "api2/inbox_action.php?"
    //https://tropicana.mycrm.asia/loyalty/api/clear_all_noti.php?custid=1
    static let readAllNotificationsAPI = "api2/clear_all_noti.php?"
    
    //MARK: PRIVILEGES
    static let PRIVILEGES_DASHBOARD = "api2/privileges_dashboard.php?"
    static let PRIVILEGES_RANKS_INFO = "api2/getRankInfo.php?"
    
    //MARK: REWARDS
    static let rewardsListAPI = "api2/webview_getRewards.php?";
    static let SearchRewardsAPI = "api2/searchByRewards.php?";
    static let rewardsListV2API = "api2/webview_getRewardsV2.php?";
    static let rewardDetailsAPI = "api2/webview_getDetails.php?";
    static let checkOutApi = "api2/checkout.php?";
    static let rewardCategoriesV2 = "api2/categoriesV2.php?";
    static let rewardTimerAPI = "api2/timer_reward.php?";
    
    //MARK: Gift redemption
    static let get_shipping_points = "api2/get_shipping_points.php?"
    static let gift_CheckOut = "api2/giftCheckout.php?"
    
    
    //MARK: My REWARDS
    static let myRewardsListAPI = "api2/webview_getWallet.php?";
    static let MultiRewardsListAPI = "api2/webview_multiWalletList.php?";
    static let myRewardDetailsAPI = "api2/webview_getWalletDetails.php?";
    static let NearByRewards = "api2/nearby_rewards.php?"
    static let NearByRewardsCategories = "api2/categories_nearby.php?"
    static let getRewardMerchantsAPI = "api2/getDirectoryListReward.php?"
    static let getSearchFilterAPI = "api2/searchFilter.php?"
    
    //MARK: EVENTS
    static let eventsAPI = "api2/webview_getEvents.php?";
    static let eventsCategoriesAPI = "api2/event_categories.php?";
    static let eventDetailsAPI = "api2/webview_eventDetails.php?";
    static let RSVPListAPI = "api2/webview_getWallet.php?";
    static let RSVPDetailsAPI = "api2/webview_getWalletDetails.php?";
    static let RSVPMultiListAPI = "api2/webview_multiWalletList.php?";
    static let eventCheckOutAPI = "api2/event_checkout.php?";
   
    //MARK: PROMOTIONS
    static let promotionsListAPI = "api2/getNews.php?";
    static let promotionDetailsAPI = "api2/getNewsDetails.php?";
    static let newsCategoryDetailsAPI = "api2/getAllNewsCategory.php?";
    
    //MARK: ARTICLES
    static let articlesListAPI = "api2/getArticle.php?";
    static let articleDetailsAPI = "api2/getArticleById.php?";
    static let articleCategoriesAPI = "api2/getArticleCategories.php?";
    
    
    //MARK: DIRECTORY
    static let getDirectoryAPI = "api2/getDirectoryList.php?"
    static let getMerchantDetail = "api2/webview_aboutMerchant.php?"
    static let getMerchantCategories = "api2/merchant_categories.php?"
    static let getCategoryAPI = "api2/categories.php?"
    static let getBranchesAPI = "api2/webview_getBranches.php?";
    
    //MARK: TRANSACATIONS
    static let check_Referral_code_API = "api/check_valid_referral.php?"
    static let Release_Points_API = "api2/releasePoints.php?"
    static let transactionHistoryAPI = "api2/merchantTransactionHistoryNew.php?"
    static let transactionHistoryDetailsAPI = "api2/merchantTransactionHistorySingle.php?"
    static let archiveTransactionAPI = "api2/archiveTransaction.php?"
    static let PAY_WITH_POINTS_API = "api/updatePayableByPoints.php?"
    
    //MARK: MIGRATE USER
    static let migrating_Member_API = "api2/getMigratedUserData.php?"
    static let Existing_USER_Check = "api2/checkMigrateExist.php?"
    static let Migrating_Reset_Password = "migration_resetpass_email_api.php?"
    static let setPasswordAPI = "api2/setPass.php?"
    
    //MARK: DELETE ACCOUNT
    static let Delete_account_api = "api2/deleteCust.php?"
    static let deleteAccountPass = "kjf93j9asr10"

    static let SCANNED_DETAIL_URL = "ecom/useCoupon.php?"
    static let uploadDirectReceiptAPI = "api2/uploadReceiptDirect.php?"
    
    //MARK: Daily check
    static let dailyCheckListAPI = "api2/get_daily_check_in_rewards.php?"
    static let dailyCheckedInAPI = "api2/daily_check_in_rewards.php?"

    //MARK: Stamp Rewards
    static let stampRewardsListAPI = "api2/get_stamp_rewards.php?"
    static let stampRewardsCheckedInAPI = "api2/stamp_rewards.php?"

    static let applytTourist_API = "api2/makeCustomerTourist.php?"

    //MARK: Country and States APIS
    static let getCountryListAPI = "api/countryList.php?"
    static let getCountryCodesListAPI = "api/getCountryCodes.php?"
    static let getBranchStatesAPI = "api/branch_states.php?"
    static let getCitiesAPI = "api/branch_city.php?"
    static let getRelatedBranchesAPI = "api/getBranches.php?"
    
    //MARK: Feedback
    static let supportAPI = "information/support_mailer.php?"
    static let supportTicketListAPI = "api/support_type.php?"
    
    //MARK: Feedback
    static let referralRewardAPI = "api2/getReferralRewardData.php?"
    static let aboutUsAPI = "api/webview_aboutus.php?"
    
    //MARK: DEEPLINKING
    static let deepLinkQrcodeAPI = "api/qr_get_message_image.php?"
    
    
}
