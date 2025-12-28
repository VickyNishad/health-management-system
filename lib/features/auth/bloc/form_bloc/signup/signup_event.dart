// signup_event.dart
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends SignUpEvent {
  final String name;
  const NameChanged(this.name);
  @override
  List<Object?> get props => [name];
}

class EmailChanged extends SignUpEvent {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends SignUpEvent {
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

class ValidateAllFields extends SignUpEvent {}

class TogglePasswordVisibility extends SignUpEvent {} // 👈 NEW
