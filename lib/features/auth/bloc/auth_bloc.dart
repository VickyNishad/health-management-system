import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicque_app/features/auth/domain/repositories/auth_repositories.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories authRepositories;

  AuthBloc({required this.authRepositories}) : super(AuthState.initial()) {
    on<SwitchFormEvent>(_onSwitchForm);
    on<AuthSignInRequestedEvent>(_onSignIn);
    on<AuthSignUpRequestedEvent>(_onSignUp);
    on<AuthGoogleSignInEvent>(_onGoogleSignIn);
    on<SendOtpEvent>(_onSendOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
  }

  // ---------------- SWITCH FORMS ----------------
  void _onSwitchForm(SwitchFormEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(formType: event.formType));
  }

  // ---------------- SIGN IN ----------------
  Future<void> _onSignIn(
    AuthSignInRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    print('call');
    emit(state.copyWith(isLoading: true, error: null));

    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false, isAuthenticated: true));
  }

  // ---------------- SIGN UP ----------------
  Future<void> _onSignUp(
    AuthSignUpRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final req = {
        "fullName": event.fullName,
        "providerLoginId": event.providerLoginId,
        "password": event.password,
        "loginType": event.loginType,
        "role": event.role,
      };

      final res = await authRepositories.signUp(req);
      final bool isSuccess = res['success'] == true;

      emit(
        state.copyWith(
          isLoading: false,
          response: isSuccess ? res : null,
          error: isSuccess ? null : res['message'],
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // ---------------- GOOGLE SIGN IN ----------------
  Future<void> _onGoogleSignIn(
    AuthGoogleSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoading: false, isAuthenticated: true));
  }

  // ---------------- SEND OTP ----------------
  Future<void> _onSendOtp(SendOtpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoading: false, otpSent: true));
  }

  // ---------------- VERIFY OTP ----------------
  Future<void> _onVerifyOtp(
    VerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    await Future.delayed(const Duration(seconds: 2));

    emit(
      state.copyWith(
        isLoading: false,
        otpVerified: true,
        isAuthenticated: true,
      ),
    );
  }
}
