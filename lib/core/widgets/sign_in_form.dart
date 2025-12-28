import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  const SignInForm({
    super.key,
    required this.onSignIn,
    required this.onGoogleAuth,
    required this.onSwitchToSignUp,
    required this.onSwitchToOtp,
  });

  @override
  Widget build(BuildContext context) {
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
          controller: TextEditingController(),
          hintText: "Email",
          obscureText: false,
          prefixIcon: Icon(Icons.email),
          keyBoardType: TextInputType.numberWithOptions(),
          errorText: "",
          onChanged: (value) {},
        ),
        SizedBox(height: 16.h),
        MyTextField(
          controller: TextEditingController(),
          hintText: "Password",
          obscureText: true,
          prefixIcon: Icon(Icons.lock),
          keyBoardType: TextInputType.numberWithOptions(),
          errorText: "",
          onChanged: (value) {},
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
          ],
        ),
        SizedBox(height: 8.h),
        MyButton(buttonTitle: "Sign In", onTap: onSignIn),
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
            SquireTile(imagePath: '/images/google.png', onTap: onGoogleAuth),

            SizedBox(width: 10.w),

            SquireTile(imagePath: '/images/apple.png', onTap: onGoogleAuth),
          ],
        ),
      ],
    );
  }
}
