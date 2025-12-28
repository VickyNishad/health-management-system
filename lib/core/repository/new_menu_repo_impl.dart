import 'package:medicque_app/core/repository/new_repo.dart';
import 'package:medicque_app/core/services/api_service.dart';

class NewMenuRepoImpl extends NewRepo {
  final ApiService apiService;

  NewMenuRepoImpl({required this.apiService});

  @override
  Future<Map<String, dynamic>> loadMenu(String endpoint) {
    // TODO: implement loadMenu
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> loadMenuByRole(String endpoint) async {
    // TODO: implement loadMenuByRole
    try {
      print('endpoint-----: $endpoint');
      final response = await apiService.get(
        'http://192.168.43.33:8080/medicque/menu/doctor',
      );
      print('menu success: $response');
      return response;
    } catch (e) {
      print('signUp failed: $e');
      rethrow;
    }
  }
}
