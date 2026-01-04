import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
  @override
  List<Object?> get props => [];
}

class EmailChanged extends SigninEvent {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends SigninEvent {
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

class ValidateAllFields extends SigninEvent {}
