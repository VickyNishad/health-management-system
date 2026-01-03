import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicque_app/core/constants/image_path/image_path.dart';
import 'package:medicque_app/core/enums/alert_type.dart';
import 'package:medicque_app/core/services/top_alert_service.dart';
import 'package:medicque_app/features/auth/patient/presentation/signup_form_ctrl.dart';
import '../../../../../../core/enums/auth_form_type.dart';
import '../../../../../../core/widgets/otp_form.dart';
import '../../../../../../core/widgets/sign_in_form.dart';
import '../../../../../../core/widgets/sign_up_form.dart';
import '../../../../../../core/widgets/verify_otp_form.dart';
import '../../../../bloc/auth_bloc.dart';
import '../../../../bloc/auth_event.dart';
import '../../../../bloc/auth_state.dart';

class PatientLoginWeb extends StatelessWidget {
  PatientLoginWeb({super.key});

  final SignUpFormController _controller = SignUpFormController();
  final TextEditingController _otpController = TextEditingController();

  // Build the form based on BLoC state
  Widget _buildForm(BuildContext context, AuthState state) {
    switch (state.formType) {
      case AuthFormType.signUp:
        return SignUpForm(
          controller: _controller,
          isLoading: state.isLoading,
          onSignUp: () {
            context.read<AuthBloc>().add(
              AuthSignUpRequestedEvent(
                providerLoginId: _controller.email.text.trim(),
                password: _controller.password.text.trim(),
                fullName: _controller.name.text.trim(),
              ),
            );
          },
          onGoogleAuth: () {},
          onSwitchToSignIn: () {
            context.read<AuthBloc>().add(SwitchFormEvent(AuthFormType.signIn));
          },
        );

      case AuthFormType.otp:
        return OTPForm(
          onSendOtp: () {},
          onSwitchToSignIn: () {
            context.read<AuthBloc>().add(SwitchFormEvent(AuthFormType.signIn));
          },
        );

      case AuthFormType.otpVerify:
        return OTPVerifyForm(
          otpController: _otpController,
          onVerify: () {},
          onResend: () {},
          onSwitchToSignIn: () {
            context.read<AuthBloc>().add(SwitchFormEvent(AuthFormType.signIn));
          },
        );

      case AuthFormType.signIn:
        return SignInForm(
          onSignIn: () {},
          onGoogleAuth: () {},
          onSwitchToSignUp: () {
            context.read<AuthBloc>().add(SwitchFormEvent(AuthFormType.signUp));
          },
          onSwitchToOtp: () {
            context.read<AuthBloc>().add(SwitchFormEvent(AuthFormType.otp));
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(ImagePath.bagroundImagePath, fit: BoxFit.cover),
          ),
          _buildWebLayout(context),
        ],
      ),
    );
  }

  Widget _buildWebLayout(BuildContext ctx) {
    return BlocConsumer<AuthBloc, AuthState>(
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
            type: AlertType.error,
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.w),
                    padding: EdgeInsets.all(24.w),
                    child: Placeholder(
                      fallbackHeight: 300.h,
                      color: const Color(0xFFE0E0E0),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 500.w),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 80),
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
                              child: _buildForm(context, state),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
