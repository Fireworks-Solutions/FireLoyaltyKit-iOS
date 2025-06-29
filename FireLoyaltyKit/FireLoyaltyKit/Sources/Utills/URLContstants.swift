//
//  URLContstants.swift
//  FireLoyaltyKit
//
//  Created by Mani bhushan M on 27/06/25.
//


struct URLContstants {
    
    //MARK: ON BOARDING
    static let baseConfigAPI = "api/baseConfig.php?"
    
    
    //MARK: AUTH
    static let AUTH_TOKEN_PASS = "fireworks!12*SP#Se"          // For Authentication
    static let secretKeyPass = "ami3jf8anasnd1f"
    static let pvcSeKey = "dknne3je8k"
    
    static let REFRESH_TOKEN_API = "api2/refreshToken.php?"        // REFRESH TOKEN
     
    static let registerEmailCheckAPI = "api2/checkEmail.php?" // Check email registered or not
    static let loginAPI = "api2/login.php?"                   // Login
    static let registerAPI = "api2/register.php?"
    
    static let changePasswordAPI = "api2/changepass.php?"     // Passwords
    static let forgotPasswordAPI = "e-commerce/api/forgetPass.php?"
    
    //MARK: DASHBOARD/HOME
    static let dashboardAPI = "api2/dashboard.php?"
    
    
    //MARK: PROFILE
    static let GET_PROFILE = "api2/profile.php?"
    static let UPDATE_PROFILE = "api2/updateProfile.php?"
    static let profileImageAPI = "api2/getProfileImage.php"
    static let updateProfilePicAPI = "api2/uploadProfilePic.php?"
    
    //MARK: NOTIFICATIONS
    static let deviceTokenAPI = "api2/addDeviceToken.php?"
    static let getNotificationAPI = "api2/getnoti.php?"
    static let setnotificationAPI = "api2/savenoti.php?"

    //MARK: REWARDS
    static let rewardsListAPI = "api2/webview_getRewards.php?";
    static let rewardDetailsAPI = "api2/webview_getDetails.php?";
    static let checkOutApi = "api2/checkout.php?";
    
    //MARK: My REWARDS
    static let myRewardsListAPI = "api2/webview_getWallet.php?";
    static let myRewardDetailsAPI = "api2/webview_getWalletDetails.php?";
    
    //MARK: EVENTS
    static let eventsAPI = "api2/webview_getEvents.php?";
    static let eventDetailsAPI = "api2/webview_eventDetails.php?";
    static let RSVPListAPI = "api2/webview_getWallet.php?";
    static let RSVPDetailsAPI = "api2/webview_getWalletDetails.php?";
    static let eventCheckOutAPI = "api2/event_checkout.php?";
   
    //MARK: DIRECTORY
    static let getDirectoryAPI = "api2/getDirectoryList.php?"
    static let getMerchantDetail = "api2/webview_aboutMerchant.php?"
    static let getCategoryAPI = "api2/categories.php?"
    static let getBranchesAPI = "api2/webview_getBranches.php?";
    
    //MARK: TRANSACATIONS
    static let check_Referral_code_API = "api/check_valid_referral.php?"
    static let Release_Points_API = "api2/releasePoints.php?"
    static let transactionHistoryAPI = "api2/merchantTransactionHistoryNew.php?"
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
}
