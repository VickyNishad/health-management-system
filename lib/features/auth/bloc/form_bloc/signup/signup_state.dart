import 'package:equatable/equatable.dart';

enum FormStatus { initial, invalid, valid }

class SignUpState extends Equatable {
  final String name;
  final String email;
  final String password;

  final String? nameError;
  final String? emailError;
  final String? passwordError;

  final FormStatus status;
  final bool isPasswordHidden;

  const SignUpState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.nameError,
    this.emailError,
    this.passwordError,
    this.status = FormStatus.initial,
    this.isPasswordHidden = false,
  });

  bool get isFormValid =>
      nameError == null &&
      emailError == null &&
      passwordError == null &&
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty;

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    String? nameError,
    String? emailError,
    String? passwordError,
    FormStatus? status,
    bool? isPasswordHidden,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      status: status ?? this.status,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    nameError,
    emailError,
    passwordError,
    status,
    isPasswordHidden,
  ];
}
