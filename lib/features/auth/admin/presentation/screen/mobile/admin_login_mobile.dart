import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicque_app/core/services/top_alert_service.dart';
import 'package:medicque_app/features/auth/patient/presentation/signin_form_ctrl.dart';

import '../../../../../../core/enums/auth_form_type.dart';
import '../../../../../../core/widgets/otp_form.dart';
import '../../../../../../core/widgets/sign_in_form.dart';
import '../../../../../../core/widgets/verify_otp_form.dart';
import '../../../../bloc/auth_bloc.dart';
import '../../../../bloc/auth_state.dart';

class AdminLoginMobile extends StatefulWidget {
  const AdminLoginMobile({super.key});

  @override
  State<AdminLoginMobile> createState() => _AdminLoginMobileState();
}

class _AdminLoginMobileState extends State<AdminLoginMobile> {
  AuthFormType _formType = AuthFormType.signIn;
  bool _isLoading = false;
  final TextEditingController _otpController = TextEditingController();
  final SigninFormCtrl _signinFormCtrl = SigninFormCtrl();
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

  // Future<void> _signUpWithEmail() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   // Simulating an API call
  //   await Future.delayed(const Duration(seconds: 2));
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   _showSnackBar('Signed up with email!');
  // }

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
      //   onSignUp: () {
      //     context.read<AuthBloc>().add(
      //       AuthSignUpRequestedEvent(providerLoginId: '', password: ''),
      //     );
      //   },
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
          signinFormCtrl: _signinFormCtrl,
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

          child: _buildMobileLayout(),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    String? statusMessage;
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        // if (state is AuthLoading) {
        //   return const Center(child: CircularProgressIndicator());
        // }
        return Stack(
          children: [
            Card(
              // color: Colors.grey[300],
              elevation: 2,
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  Text(statusMessage ?? ''),
                  Padding(padding: EdgeInsets.all(24.w), child: _buildForm()),
                ],
              ),
            ),
            if (state.isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        );
      },
      listener: (context, state) {
        if (state.response != null) {
          TopAlertService().show(
            context: context,
            message: state.response?['status'] ?? 'Success',
          );
        } else if (state.error != null) {
          TopAlertService().show(
            context: context,
            message: state.error.toString(),
          );
        }
      },
    );
  }
}
