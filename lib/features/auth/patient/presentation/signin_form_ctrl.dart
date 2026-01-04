import 'package:flutter/material.dart';

class SigninFormCtrl {
  final email = TextEditingController();
  final password = TextEditingController();

  void clearControllers() {
    email.clear();
    password.clear();
  }

  void dispose() {
    email.dispose();
    password.dispose();
  }
}
