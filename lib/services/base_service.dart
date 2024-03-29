class URL {
  static const String baseURL = "https://mrinvito.com/laravel/easylife/api/";
  static const String faqUrl = '${baseURL}faqs';
  static const String loginUrl = '${baseURL}userlogin';
  static const String getOTP = '${baseURL}getOTP';
  static const String verifyOtp = '${baseURL}OTPVerify';
  static const String setPassword = '${baseURL}verifysetPassword';
  static const String signUpUrl = '${baseURL}serviceprovidersignup';
  static const String termsUrl = '${baseURL}termscondition';
  static const String dashboardUrl =
      '${baseURL}serviceprovidersdashboard?user_id=';
  static const String jobDetailUrl = '${baseURL}serviceprovidersBidPost';
  static const String bidAppliedUrl = '${baseURL}serviceprovidersBidApplied';
  static const String bidUpdateUrl = '${baseURL}serviceprovidersBidUpdate';
  static const String bidRemoveUrl = '${baseURL}serviceprovidersBidRemove';
  static const String myJobListUrl = '${baseURL}serviceprovidersJoblist';
  static const String jobStart = '${baseURL}serviceprovidersJobStart?job_id=';
  static const String jobComplete = '${baseURL}serviceprovidersJobCompleted';
  static const String complaintList =
      '${baseURL}usercomplaintslist?created_by=';
  static const String createComplaint = '${baseURL}usercomplaints';
  static const String getJobReviewRating =
      '${baseURL}getjobreviewratting?job_id=';
  static const String messageList = '${baseURL}userchatslist?user_id=';
  static const String sendMessage = '${baseURL}userchats';
  static const String chatHistory =
      '${baseURL}userchatshistory?user_id=X&serviceprovider_id=Y';
  static const String submitHelp = '${baseURL}helpdetails';
  static const String serviceProvidersList = '${baseURL}userlist';
  static const String jobList = '${baseURL}joblist';
   static const String userChangePassword = '${baseURL}userchangepassword';
    static const String sPProfile = '${baseURL}serviceproviderprofileByID';
     static const String sPSubmit = '${baseURL}serviceproviderprofileSubmit';
}
