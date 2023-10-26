//
//  AppConstant.swift
//  CommonCode
//
// 
//
//
import Foundation
import UIKit


// MARK: - Structure

//typealias  JSON = [String:Any]?

let kAppName                    = "PROCRUITED"
let kIsTutorialAlreadyShown     = "isTutorialAlreadyShown"
let kIsUserLoggedIn             = "isUserLoggedIn"
let kLoggedInAccessToken        = "token"
let kLoggedInUserDetails        = "loggedInUserDetails"
let kLoggedInUserId             = "loggedInUserId"
let kLatitude                   = "latitude"
let kLongitude                  = "longitude"
let kIsOtpVerified              = "is_mobile_verified"
let kIsProfileCreated           = "is_profile_create"
let kIs_Active                  = "is_active"
let kIs_Notification            = "is_notification"
let kIsAppInstalled             = "isAppInstalled"
let kAccessToken                = "accessToken"
let kDeviceToken                = "device_token"
let iosDeviceType               = "4"
let iosDeviceTokan              = "123456789"
let kSharedAppDelegate          = UIApplication.shared.delegate as? AppDelegate
let kSharedInstance             = SharedClass.sharedInstance
//let kSharedSceneDelegate        = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
let kSharedUserDefaults         = UserDefaults.standard
let kScreenWidth                = UIScreen.main.bounds.size.width
let kScreenHeight               = UIScreen.main.bounds.size.height
let kRootVC                     = UIApplication.shared.windows.first?.rootViewController
let kBundleID                   = Bundle.main.bundleIdentifier!
let kIsLogin                    =  "islogin"



enum  HasCameFrom {
    case restaurant, seller,none
}


struct ServiceName {
    static let login = "promoted/public/api/auth/login"
    static let forgotPassword = "promoted/public/api/auth/forgot-password"
    static let checkUserAvil = "promoted/public/api/auth/check-user-availability"
    static let checknumber = "promoted/public/api/auth/check-mobile-validation"
    static let sendOtp = "promoted/public/api/auth/send-otp"
    static let verifyOtp = "promoted/public/api/auth/verify-otp"
    static let resendOtp = "promoted/public/api/auth/resend-otp"
    static let companyRegister = "promoted/public/api/auth/company-recruiter-register"
    static let companyProfile = "promoted/public/api/auth/company-recruiter-profile"
    static let updateCompanyProfile = "promoted/public/api/auth/update-company-recruiter"
    static let uploadDoc = "promoted/public/api/auth/attach-file"
    static let candidateMatchingAlgo = "promoted/public/api/auth/candidates-matching-algorithm"
    static let candidateMatchingAlgobasedonjobid = "promoted/public/api/auth/candidates-matching-algorithm-according-to-job-listing"
    static let shortListACandidate = "promoted/public/api/auth/shortlist-a-candidate"
    static let getJobListing = "promoted/public/api/auth/get-job-listing"
    static let getcompanylist = "promoted/public/api/auth/chat-recruiter-listing"
    static let newJobListing = "promoted/public/api/auth/job-listing-register"
    static let updateJobListing = "promoted/public/api/auth/update-job-listing"
    static let getJobListingDetail = "promoted/public/api/auth/get-job-listing-details"
    static let getShortlistCandidate = "promoted/public/api/auth/get-shortlisted-candidate-by-job-listing"
    static let sendInterviewRequest = "promoted/public/api/auth/shchedule-a-interview"
    static let getCandidateDetail = "promoted/public/api/auth/matched-candidate-profile"
    //static let updatecompanyProfile = "promoted/public/api/auth/update-company-recruiter"
    static let getCompanyAllMessage = "promoted/public/api/auth/all-message"
    static let sendCompanyMessage = "promoted/public/api/auth/send-message"
    static let followUpNotification = "promoted/public/api/auth/follow-up-notification"
    static let candidateNotification = "promoted/public/api/auth/candidate-notification"
    static let companyFAQ = "promoted/public/api/auth/company-faq"
    static let userFAQ = "promoted/public/api/auth/job-seeker-faq"
    static let supportQuestion = "promoted/public/api/auth/submit-support-question"
    static let CandidateRegister = "promoted/public/api/auth/job-seeker-register"
    static let userProfile = "promoted/public/api/auth/job-seeker-details"
    static let updateUserProfile = "promoted/public/api/auth/update-job-seeker-details"
    static let userPayment = "promoted/public/api/auth/unlock-portfolio-and-video"
    static let companyCurrentPlan = "promoted/public/api/auth/company-recruiter-plan-subscription-details"
    static let companyPlanList = "promoted/public/api/auth/company-recruiter-plan"
    static let companyPayment = "promoted/public/api/auth/company-recruiter-subscription"
    static let oneTimeCompanyPayment = "promoted/public/api/auth/single-job-listing-payment"
    static let candidateJobSetting = "promoted/public/api/auth/job-seeker-job-interest-settings"
    static let updateJobSetting = "promoted/public/api/auth/update-job-seeker-job-interest-settings"
    static let getJobExperince = "promoted/public/api/auth/job-seeker-work-experience"
    static let updateJobExperince = "promoted/public/api/auth/update-job-seeker-work-experience"
    static let getnotificationCompanyList = "promoted/public/api/auth/jobseeker-side-notification-list"
    static let matchedCandidateDetail = "promoted/public/api/auth/matched-candidate-profile"
    static let deleteAccount = "promoted/public/api/auth/delete-account"
    static let logout = "promoted/public/api/auth/logout"
    static let interviewCompanyList = "promoted/public/api/auth/jobseeker-shcheduled-interview"
    static let matchedInterviewDetail = "promoted/public/api/auth/jobseeker-scheduled-interview-details"
    static let acceptInterview = "promoted/public/api/auth/update-jobseeker-shcheduled-interview"
    static let rescheduleInreview = "promoted/public/api/auth/reschedule-interview-request"
    static let industryList = "promoted/public/api/auth/get-industries"
    static let jobRoleList = "promoted/public/api/auth/get-job-roles-by-industries"
    static let singlejobPlan = "promoted/public/api/auth/get-single-job-amount"
    
}

struct ApiParameters {
    static let k   = "userProfileImage"
    static let K_StoreName = "storeName"
    static let message = "message"
   
  
    
        
    static let ktitle = "title"
    static let kimage = "image"
    static let kpromoCode = "promoCode"
    static let kminimumCartQuantity = "minimumCartQuantity"
    static let kminimumPrice = "minimumPrice"
    static let kofferDiscount = "offerDiscount"
    static let kfromDate = "fromDate"
    static let ktoDate = "toDate"
    static let ksubCategoryId = "subCategoryId"
    static let kcategoryId = "categoryId"
    static let ksellerId = "sellerId"
    static let kproductId = "productId"
}

struct AppColors {
   static  let appThemeGrey = "#E5E5E5"
    static let appThemeBlue = "#55A9ED"
}

struct NumberContants {
    static let kMinPasswordLength = 8
}

struct  AlertMessage {
    static let kDefaultError                  = "Something went wrong. Please try again."
    static let knoNetwork                     = "Please check your internet connection !"
    static let kSessionExpired                = "Your session has expired. Please login again. -> 🚀 "
    static let kNoInternet                    = "Unable to connect to the Internet. Please try again."
    static let kInvalidUser                   = "Oops something went wrong. Please try again later."
    static let knoData                        = "No Data Found 🎈"
    static let noName                         = "Empty name 🚀"
    static let Under_Development              = "Under Development 👨‍🏫"
    static let logout                         = "Are you sure you want to logout?"
    static let signin                         = "Please sign in first."
    static let currentPagealert               = "you are already on this page 🤣 -> 🚀"
}

struct Storyboards {
    static let kMain                           = "Main"
    static let kHome                           = "Home"
    
}



struct Notifications {

    
    static let kEnterValidEmail                 = "Please enter valid email id"
    static let kEnterValidMobile                = "Please enter valid mobile number"
    static let kPassword                        = "Please enter password"
    static let kValidPassword                   = "Password should be of minimum 8 characters including alphabets, numbers & special characters."
    static let kNewPassword                     = "Please enter New Password"
  
 static let KEmailOrMobileNumber                = "Please enter your e-mail"
    static let KValidEmail                      = "Please enter valid email id"
    static let Kname                            = "Please enter Name"
    static let KValidname                      = "Please enter valid Name"
    static let KMobileNumber                   = "Please enter Mobile Number"
    static let KProfileImage                   = "Please select Profile Image"
   
}


struct AlertTitle {
    static let kOk                = "OK"
    static let kCancel            = "Cancel"
    static let kDone              = "Done"
    static let ChooseDate         = "Choose Date"
    static let SelectCountry      = "Select Country"
    static let logout             = "Logout"
    
}




struct OtherConstant {
    static let kAppDelegate        = UIApplication.shared.delegate as? AppDelegate
    // static let kRootVC             = UIApplication.shared.keyWindow?.rootViewController
    static let kBundleID           = Bundle.main.bundleIdentifier!
    static let kGenders: [String]  = ["Male", "Female", "Other"]
    static let kReviewsSortBy: [String] = ["Recent", "Last Month", "Last Year"]
}

func Localised(_ aString:String) -> String {
    
    return NSLocalizedString(aString, comment: aString)
}



struct Indicator {
    
    static func showToast(message aMessage: String)
    {
        DispatchQueue.main.async
        {
            showAlertMessage.alert(message: aMessage)
        }
    }
}

// Enums
enum PhotoSource {
    case library
    case camera
}

enum MessageType {
    case photo
    case text
    case video
    case audio
}

enum MessageOwner {
    case sender
    case receiver
}

enum BottomOptions: Int {
    case search = 0
    case match
    case message
    case post
}

//enum HasCameFrom{
//    case Forgot // forgot Password flow
//    case SignUp
//    case ResetPassword
//}


enum OpenMediaType: Int {
    case camera = 0
    case photoLibrary
    case videoCamera
    case videoLibrary
}



enum AppFonts {
    case bold(CGFloat),regular(CGFloat)
    var font:UIFont {
        switch self {
        case .bold(let size):
            return UIFont (name: "System", size: size)!
        case .regular(let size):
            return UIFont.systemFont(ofSize: size)
        }
    }
}



//MARK: ---------Method Constants---------


func print_debug(items: Any) {
    print(items)
}

func print_debug_fake(items: Any) {
}

