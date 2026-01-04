import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicque_app/core/enums/form_state.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signin/signin_bloc.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signin/signin_event.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signin/signin_state.dart';
import 'package:medicque_app/features/auth/patient/presentation/signin_form_ctrl.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'devider.dart';
import 'squire_tile.dart';

// This widget represents the sign-in form for the login screen.

class SignInForm extends StatelessWidget {
  final VoidCallback onSignIn;
  final VoidCallback onGoogleAuth;
  final VoidCallback onSwitchToSignUp;
  final VoidCallback onSwitchToOtp;
  final SigninFormCtrl signinFormCtrl;
  final bool isLoading;

  const SignInForm({
    super.key,
    required this.onSignIn,
    required this.onGoogleAuth,
    required this.onSwitchToSignUp,
    required this.onSwitchToOtp,
    required this.signinFormCtrl,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninBloc, SigninState>(
      listenWhen: (p, c) => p.formStatus != c.formStatus,
      listener: (context, state) {
        if (state.formStatus == FormStatus.valid) {
          onSignIn();
        }
      },
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) {
          final bloc = context.read<SigninBloc>();
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Wrap the Text widget in Expanded to prevent overflow
                  Expanded(
                    child: Text(
                      'Not a member?',
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  TextButton(
                    onPressed: onSwitchToSignUp,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              MyTextField(
                controller: signinFormCtrl.email,
                hintText: "Email",
                obscureText: false,
                prefixIcon: Icon(Icons.email),
                keyBoardType: TextInputType.numberWithOptions(),
                errorText: state.emailError,
                onChanged: (value) {
                  bloc.add(EmailChanged(value));
                },
              ),
              SizedBox(height: 16.h),
              MyTextField(
                controller: signinFormCtrl.password,
                hintText: "Password",
                obscureText: true,
                prefixIcon: Icon(Icons.lock),
                keyBoardType: TextInputType.numberWithOptions(),
                errorText: state.passwordError,
                onChanged: (value) {
                  bloc.add(PasswordChanged(value));
                },
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              MyButton(
                buttonTitle: isLoading ? "Signing..." : "Sign In",
                onTap: () {
                  bloc.add(ValidateAllFields());
                },
                isLoading: isLoading,
              ),
              SizedBox(height: 8.h),
              MyDevider(),
              SizedBox(height: 8.h),
              MyButton(buttonTitle: "Sign In with OTP?", onTap: onSwitchToOtp),
              SizedBox(height: 8.h),
              MyDevider(),

              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquireTile(
                    imagePath: '/images/google.png',
                    onTap: onGoogleAuth,
                  ),

                  SizedBox(width: 10.w),

                  SquireTile(
                    imagePath: '/images/apple.png',
                    onTap: onGoogleAuth,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
