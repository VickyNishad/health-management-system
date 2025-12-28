import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class PatientLoginTablet extends StatelessWidget {
  PatientLoginTablet({super.key});

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
              AuthSignUpRequestedEvent(providerLoginId: "", password: ""),
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
      body: _buildTabletLayout(context),
    );
  }

  Widget _buildTabletLayout(BuildContext ctx) {
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
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Center(
            child: Card(
              elevation: 8,
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(50.w), // Larger padding for tablet
                child: _buildForm(context, state),
              ),
            ),
          ),
        );
      },
    );
  }
}
