import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicque_app/core/utils/validators/form_validators.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signin/signin_event.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signin/signin_state.dart';

import '../../../../../core/enums/form_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(const SigninState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ValidateAllFields>(_onValidateAllFields);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SigninState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        emailError: FormValidators.validateEmail(event.email),
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SigninState> emit) {
    emit(
      state.copyWith(
        password: event.password,
        passwordError: FormValidators.validatePassword(event.password),
        // allFieldsValidated: false, // reset flag
      ),
    );
  }

  void _onValidateAllFields(
    ValidateAllFields event,
    Emitter<SigninState> emit,
  ) {
    final emailErr = FormValidators.validateEmail(state.email);
    final passErr = FormValidators.validatePassword(state.password);

    final isValid =
        emailErr == null &&
        passErr == null &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty;

    emit(
      state.copyWith(
        emailError: emailErr,
        passwordError: passErr,
        formStatus: isValid ? FormStatus.valid : FormStatus.invalid,
      ),
    );

    // reset status *after* listener sees "valid"
    if (isValid) emit(state.copyWith(formStatus: FormStatus.initial));
  }
}
