import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

// This widget represents the form for verifying a received OTP.

class OTPVerifyForm extends StatelessWidget {
  final TextEditingController otpController;
  final VoidCallback onVerify;
  final VoidCallback onResend;
  final VoidCallback onSwitchToSignIn;

  const OTPVerifyForm({
    super.key,
    required this.otpController,
    required this.onVerify,
    required this.onResend,
    required this.onSwitchToSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Verify OTP',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        MyTextField(
          controller: TextEditingController(),
          hintText: "Password",
          obscureText: true,
          prefixIcon: Icon(Icons.lock),
          keyBoardType: TextInputType.number,
          errorText: "",
          onChanged: (value) {},
        ),
        SizedBox(height: 24.h),
        MyButton(buttonTitle: "Verify", onTap: onVerify),
        SizedBox(height: 16.h),
        MyButton(buttonTitle: "Resend OTP", onTap: onResend),
        SizedBox(height: 8.h),
        TextButton(
          onPressed: onSwitchToSignIn,
          child: const Text('Go back to Sign In'),
        ),
      ],
    );
  }
}
