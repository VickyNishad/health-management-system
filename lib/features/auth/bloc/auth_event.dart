import 'package:flutter/foundation.dart';
import 'package:medicque_app/core/enums/auth_form_type.dart';

@immutable
abstract class AuthEvent {}

class AuthSignInRequestedEvent extends AuthEvent {
  final String? email;
  final String? password;
  AuthSignInRequestedEvent({this.email, this.password});
}

class AuthSignUpRequestedEvent extends AuthEvent {
  String? providerLoginId;
  String? password;
  String? fullName;
  String? loginType;
  String? role;

  AuthSignUpRequestedEvent({
    this.password,
    this.providerLoginId,
    this.fullName,
    this.loginType,
    this.role,
  });
}

class AuthSignOutRequestedEvent extends AuthEvent {
  String? providerLoginId;
  String? password;
  AuthSignOutRequestedEvent({this.password, this.providerLoginId});
}

class AuthGoogleSignInEvent extends AuthEvent {
  String? providerLoginId;
  String? password;
  AuthGoogleSignInEvent({this.password, this.providerLoginId});
}

class SendOtpEvent extends AuthEvent {
  final String phone;
  SendOtpEvent(this.phone);
}

class VerifyOtpEvent extends AuthEvent {
  final String otp;
  VerifyOtpEvent(this.otp);
}

class SwitchFormEvent extends AuthEvent {
  final AuthFormType formType;

  SwitchFormEvent(this.formType);
}
