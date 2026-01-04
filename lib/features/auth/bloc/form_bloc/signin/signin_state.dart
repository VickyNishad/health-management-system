import 'package:equatable/equatable.dart';
import 'package:medicque_app/core/enums/form_state.dart';

class SigninState extends Equatable {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final bool isPasswordHidden;
  final FormStatus formStatus;

  const SigninState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.isPasswordHidden = true,
    this.formStatus = FormStatus.initial,
  });

  SigninState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? isPasswordHidden,
    FormStatus? formStatus,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    emailError,
    passwordError,
    isPasswordHidden,
    formStatus,
  ];
}
