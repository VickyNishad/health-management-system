import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicque_app/core/services/top_alert_service.dart';
import '../../../../../../core/enums/auth_form_type.dart';
import '../../../../../../core/widgets/otp_form.dart';
import '../../../../../../core/widgets/sign_in_form.dart';
import '../../../../../../core/widgets/verify_otp_form.dart';
import '../../../../bloc/auth_bloc.dart';
import '../../../../bloc/auth_state.dart';

class DoctorLoginWeb extends StatefulWidget {
  const DoctorLoginWeb({super.key});

  @override
  State<DoctorLoginWeb> createState() => _DoctorLoginWebState();
}

class _DoctorLoginWebState extends State<DoctorLoginWeb> {
  AuthFormType _formType = AuthFormType.signIn;
  bool _isLoading = false;
  final TextEditingController _otpController = TextEditingController();

  // --- Placeholder methods for authentication logic ---
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
          onSignIn: _signInWithEmail,
          onGoogleAuth: _signInWithGoogle,
          onSwitchToSignUp: () =>
              setState(() => _formType = AuthFormType.signUp),
          onSwitchToOtp: () => setState(() => _formType = AuthFormType.otp),
        );
    }
  }

  // The main UI layout for web.
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[300], body: _buildWebLayout());
  }

  Widget _buildWebLayout() {
    String? statusMessage;
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        // if (state is AuthLoading) {
        //   return Center(child: CircularProgressIndicator());
        // }

        return Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left side: Placeholder for an image or animation
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400.w),
                    padding: EdgeInsets.all(24.w),
                    child: Placeholder(
                      fallbackHeight: 400.h,
                      color: const Color(0xFFE0E0E0),
                    ),
                  ),
                ),
                // Right side: The main auth card
                // SizedBox(width: 48.w),
                Expanded(
                  // Wrap the Container in an Expanded widget
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400.w),
                    // color: Colors.grey[300],
                    child: Stack(
                      children: [
                        Card(
                          elevation: 8,
                          color: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24.w),
                            child: _buildForm(),
                          ),
                        ),
                        if (state.isLoading)
                          Positioned.fill(
                            child: Container(
                              // color: Colors.black12,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
