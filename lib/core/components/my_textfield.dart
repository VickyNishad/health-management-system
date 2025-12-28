import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyBoardType;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    required this.keyBoardType,
    this.errorText,
    this.onChanged,
    this.inputFormatters,
    this.maxLength,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyBoardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      readOnly: readOnly,
      onTap: onTap,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        counterText: "", // hides maxLength counter
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }
}
