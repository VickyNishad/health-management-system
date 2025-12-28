import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';
import 'signup_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ValidateAllFields>(_onValidateAllFields);
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }

  void _onNameChanged(NameChanged event, Emitter<SignUpState> emit) {
    emit(
      state.copyWith(
        name: event.name,
        nameError: _validateName(event.name),
        // allFieldsValidated: false, // reset flag
      ),
    );
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        emailError: _validateEmail(event.email),
        // allFieldsValidated: false, // reset flag
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignUpState> emit) {
    emit(
      state.copyWith(
        password: event.password,
        passwordError: _validatePassword(event.password),
        // allFieldsValidated: false, // reset flag
      ),
    );
  }

  void _togglePasswordVisibility(event, emit) {
    emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));
  }

  void _onValidateAllFields(
    ValidateAllFields event,
    Emitter<SignUpState> emit,
  ) {
    final nameErr = _validateName(state.name);
    final emailErr = _validateEmail(state.email);
    final passErr = _validatePassword(state.password);

    final isValid =
        nameErr == null &&
        emailErr == null &&
        passErr == null &&
        state.name.isNotEmpty &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty;

    emit(
      state.copyWith(
        nameError: nameErr,
        emailError: emailErr,
        passwordError: passErr,
        status: isValid ? FormStatus.valid : FormStatus.invalid,
      ),
    );

    // reset status *after* listener sees "valid"
    if (isValid) emit(state.copyWith(status: FormStatus.initial));
  }

  // ------------ Validators -----------------
  String? _validateName(String value) {
    if (value.trim().isEmpty) return "Name is required";
    if (value.trim().length < 2) return "Too short";
    return null;
  }

  String? _validateEmail(String value) {
    if (value.trim().isEmpty) return "Email is required";
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(value)) return "Invalid email";
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) return "Password is required";
    if (value.length < 6) return "Min 6 characters";
    return null;
  }
}
