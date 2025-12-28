import 'package:medicque_app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/services/api_service.dart';

class AuthRepositoryImpl extends AuthRepositories {
  final ApiService apiService;

  AuthRepositoryImpl({required this.apiService});

  @override
  Future<void> signIn(int id) async {
    print('Repository: signIn call initiated...');
    try {
      final response = await apiService.post('/sign-in', {'id': id});
      // You can store token here if needed:
      // await apiService.saveToken(response['token']);
      print('Repository: signIn successful. Response: $response');
      return; // Future<void>
    } catch (e) {
      print('Repository: signIn failed with error: $e');
      rethrow; // let Bloc handle it
    }
  }

  @override
  Future<Map<String, dynamic>> signUp(dynamic request) async {
    try {
      print('request-----: $request');
      final response = await apiService.post(
        'http://192.168.43.33:8080/medicque/auth/patient/sign-up',
        request,
      );
      print('signUp success: $response');
      return response;
    } catch (e) {
      print('signUp failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> sentOtp(int id) async {
    try {
      await apiService.post('/send-otp', {'id': id});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verifyOtp(int id) async {
    try {
      await apiService.post('/verify-otp', {'id': id});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword(int id) async {
    try {
      await apiService.post('/forgot-password', {'id': id});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut(int id) async {
    try {
      await apiService.post('/sign-out', {'id': id});
    } catch (e) {
      rethrow;
    }
  }
}
