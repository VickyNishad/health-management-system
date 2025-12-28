import 'package:flutter/material.dart';

class SignUpFormController {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
  }
}
