// // ignore_for_file: must_be_immutable

// import 'package:flutter/foundation.dart';
// import 'package:medicque_app/core/enums/auth_form_type.dart';

// @immutable
// abstract class AuthState {}

// class AuthLoading extends AuthState {}

// class AuthInitialState extends AuthState {}

// class AuthLoadingState extends AuthState {}

// class AuthSuccessState extends AuthState {
//   final Map<String, dynamic> response;
//   AuthSuccessState({required this.response});
// }

// class AuthFailureState extends AuthState {
//   // get error message here
//   String? error;
//   AuthFailureState(this.error);
// }

// class UnauthenticatedState extends AuthState {}

// class AuthenticatedState extends AuthState {}

// class OtpSentState extends AuthState {}

// class OtpVerifiedState extends AuthState {}

// class FormSwitchSate extends AuthState {
//   final AuthFormType formType;

//   FormSwitchSate({required this.formType});

//   FormSwitchSate copyWith({AuthFormType? formType}) {
//     return FormSwitchSate(formType: formType ?? this.formType);
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:medicque_app/core/enums/auth_form_type.dart';

@immutable
class AuthState {
  final AuthFormType formType;

  final bool isLoading;
  final String? error;
  final Map<String, dynamic>? response;

  final bool otpSent;
  final bool otpVerified;

  final bool isAuthenticated;

  const AuthState({
    required this.formType,
    this.isLoading = false,
    this.error,
    this.response,
    this.otpSent = false,
    this.otpVerified = false,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    AuthFormType? formType,
    bool? isLoading,
    String? error,
    Map<String, dynamic>? response,
    bool? otpSent,
    bool? otpVerified,
    bool? isAuthenticated,
  }) {
    return AuthState(
      formType: formType ?? this.formType,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      response: response,
      otpSent: otpSent ?? this.otpSent,
      otpVerified: otpVerified ?? this.otpVerified,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  factory AuthState.initial() => const AuthState(formType: AuthFormType.signIn);
}
