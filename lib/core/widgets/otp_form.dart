import 'package:flutter/material.dart';

import '../../../../../core/components/my_textfield.dart';
import '../components/my_button.dart';
import 'devider.dart';

// This widget represents the form for sending an OTP to a mobile number.

class OTPForm extends StatelessWidget {
  final VoidCallback onSendOtp;
  final VoidCallback onSwitchToSignIn;

  const OTPForm({
    super.key,
    required this.onSendOtp,
    required this.onSwitchToSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Sign In with OTP',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),

        MyButton(
          buttonTitle: "Sign in with login credentials",
          onTap: onSwitchToSignIn,
        ),

        // TextButton(
        //   onPressed: onSwitchToSignIn,

        //   child: const Text('Sign in with login credentials'),
        // ),
        const SizedBox(height: 8),
        MyDevider(),
        const SizedBox(height: 24),
        MyTextField(
          controller: TextEditingController(),
          hintText: "Enter Your Name",
          obscureText: true,
          prefixIcon: Icon(Icons.person),
          keyBoardType: TextInputType.numberWithOptions(),
          errorText: "",
          onChanged: (value) {},
        ),
        const SizedBox(height: 24),
        MyTextField(
          controller: TextEditingController(),
          hintText: "Mobile Number",
          obscureText: false,
          prefixIcon: Icon(Icons.phone),
          keyBoardType: TextInputType.number,
          errorText: "",
          onChanged: (value) {},
        ),
        const SizedBox(height: 24),
        // ElevatedButton(onPressed: onSendOtp, child: const Text('Send OTP')),
        MyButton(buttonTitle: "Send OTP", onTap: onSendOtp),
      ],
    );
  }
}
