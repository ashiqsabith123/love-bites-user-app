class ApiEndPoints {
  static String baseUrl = 'http://192.168.78.45:8081/user';
  static String sendOtp = '/otp/send';
  static String verifyOtpAndAuth = '/otp/verify';
  static String saveuserdetails = '/details';
  static String uploadPhotos = '/upload/photos';
  static String saveUserPref = '/save/prefrences';
  static String getMatches = '/match';
  static String makeInterest = '/interest/create/:recieverId';
}
