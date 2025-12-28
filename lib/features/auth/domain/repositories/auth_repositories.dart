abstract class AuthRepositories {
  // signin repo
  Future<void> signIn(int id);
  // signup
  Future<Map<String, dynamic>> signUp(dynamic request);
  // signout
  Future<void> signOut(int id);
  // forgot password
  Future<void> forgotPassword(int id);
  // send otp
  Future<void> sentOtp(int id);
  // veriy otp
  Future<void> verifyOtp(int id);
  // signin with google/facebook
}
