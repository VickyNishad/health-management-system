import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signup/signup_bloc.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signup/signup_event.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signup/signup_state.dart';
import 'package:medicque_app/features/auth/patient/presentation/signup_form_ctrl.dart';

import '../../../../../core/components/my_textfield.dart';
import '../components/my_button.dart';
import 'devider.dart';
import 'squire_tile.dart';

class SignUpForm extends StatelessWidget {
  final VoidCallback onSignUp;
  final VoidCallback onGoogleAuth;
  final VoidCallback onSwitchToSignIn;
  final SignUpFormController controller;
  final bool isLoading;

  const SignUpForm({
    super.key,
    required this.onSignUp,
    required this.onGoogleAuth,
    required this.onSwitchToSignIn,
    required this.controller,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) {
        if (state.status == FormStatus.valid) {
          onSignUp();
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          final bloc = context.read<SignUpBloc>();

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create an Account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text('Already have an account?', softWrap: false),
                    ),
                    TextButton(
                      onPressed: onSwitchToSignIn,
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                /// NAME
                MyTextField(
                  controller: controller.name,
                  hintText: "Enter your name",
                  obscureText: false,
                  prefixIcon: const Icon(Icons.person),
                  keyBoardType: TextInputType.name,
                  errorText: state.nameError,
                  onChanged: (v) => bloc.add(NameChanged(v)),
                ),
                SizedBox(height: 16.h),

                /// EMAIL
                MyTextField(
                  controller: controller.email,
                  hintText: "Email",
                  obscureText: false,
                  prefixIcon: const Icon(Icons.email),
                  keyBoardType: TextInputType.emailAddress,
                  errorText: state.emailError,
                  onChanged: (v) => bloc.add(EmailChanged(v)),
                ),
                SizedBox(height: 16.h),

                /// PASSWORD
                MyTextField(
                  controller: controller.password,
                  hintText: "Password",
                  obscureText: state.isPasswordHidden ? false : true,
                  prefixIcon: const Icon(Icons.lock),
                  keyBoardType: TextInputType.visiblePassword,
                  errorText: state.passwordError,
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<SignUpBloc>().add(
                        TogglePasswordVisibility(),
                      );
                    },
                    icon: Icon(
                      state.isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  onChanged: (v) => bloc.add(PasswordChanged(v)),
                ),

                SizedBox(height: 24.h),

                /// SIGN UP BUTTON
                MyButton(
                  //             MyButton(
                  buttonTitle: isLoading ? "Signing..." : "Sign Up",
                  onTap: () {
                    bloc.add(ValidateAllFields());
                  },
                  isLoading: isLoading,
                ),

                SizedBox(height: 16.h),
                const MyDevider(),
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
            ),
          );
        },
      ),
    );
  }
}
