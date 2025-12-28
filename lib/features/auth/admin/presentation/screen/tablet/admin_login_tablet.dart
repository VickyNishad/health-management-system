import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/enums/auth_form_type.dart';
import '../../../../../../core/widgets/otp_form.dart';
import '../../../../../../core/widgets/sign_in_form.dart';
import '../../../../../../core/widgets/verify_otp_form.dart' show OTPVerifyForm;

class AdminLoginTablet extends StatefulWidget {
  const AdminLoginTablet({super.key});

  @override
  State<AdminLoginTablet> createState() => _AdminLoginTabletState();
}

class _AdminLoginTabletState extends State<AdminLoginTablet> {
  AuthFormType _formType = AuthFormType.signIn;
  bool _isLoading = false;
  final TextEditingController _otpController = TextEditingController();

  // --- Placeholder methods for authentication logic ---
  // In a real app, these would call a service or API.

  Future<void> _signInWithEmail() async {
    setState(() {
      _isLoading = true;
    });
    // Simulating an API call
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
    _showSnackBar('Signed in with email!');
  }

  Future<void> _signUpWithEmail() async {
    setState(() {
      _isLoading = true;
    });
    // Simulating an API call
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
    _showSnackBar('Signed up with email!');
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    // Simulating a Google Auth flow
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
    _showSnackBar('Signed in with Google!');
  }

  Future<void> _sendOtp() async {
    setState(() {
      _isLoading = true;
    });
    // Simulating sending an OTP
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
      _formType = AuthFormType.otpVerify;
    });
    _showSnackBar('OTP sent successfully! Please enter the code to verify.');
  }

  Future<void> _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });
    // Simulating OTP verification
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
    _showSnackBar('OTP verified! User logged in.');
  }

  // Helper method to show a SnackBar message
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Build the form based on the current state
  Widget _buildForm() {
    switch (_formType) {
      case AuthFormType.signUp:
      // return SignUpForm(
      //   onSignUp: _signUpWithEmail,
      //   onGoogleAuth: _signInWithGoogle,
      //   onSwitchToSignIn: () =>
      //       setState(() => _formType = AuthFormType.signIn),
      // );
      case AuthFormType.otp:
        return OTPForm(
          onSendOtp: _sendOtp,
          onSwitchToSignIn: () =>
              setState(() => _formType = AuthFormType.signIn),
        );
      case AuthFormType.otpVerify:
        return OTPVerifyForm(
          otpController: _otpController,
          onVerify: _verifyOtp,
          onResend: _sendOtp,
          onSwitchToSignIn: () =>
              setState(() => _formType = AuthFormType.signIn),
        );
      case AuthFormType.signIn:
        return SignInForm(
          onSignIn: _signInWithEmail,
          onGoogleAuth: _signInWithGoogle,
          onSwitchToSignUp: () =>
              setState(() => _formType = AuthFormType.signUp),
          onSwitchToOtp: () => setState(() => _formType = AuthFormType.otp),
        );
    }
  }

  // The main UI layout using LayoutBuilder for responsiveness.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            24.w,
          ), // Using ScreenUtil for responsive padding

          child: _buildTabletLayout(),
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    // This layout is currently identical to the mobile one but you can
    // customize it to be different, such as a wider card or a different alignment.
    return Card(
      elevation: 8,
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(48.w), // Larger padding for tablet
        child: _buildForm(),
      ),
    );
  }
}
