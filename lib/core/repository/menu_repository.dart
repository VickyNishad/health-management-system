// lib/core/repository/menu_repository.dart
import 'dart:async';
import 'package:medicque_app/core/services/api_service.dart';

import '../services/assets_json_loader.dart';
import '../config/menu_config_response.dart';

class MenuRepository {
  ApiService apiService;
  MenuRepository({required this.apiService});

  Future<Map<String, dynamic>> loadMenuConfigJson() async {
    // uses your existing AssetJsonLoader
    final Map<String, dynamic> json = await AssetJsonLoader.loadJsonAsset(
      'menu_config.json',
    );
    return json;
  }

  Future<MenuConfigResponse> loadMenuConfig() async {
    final json = await loadMenuConfigJson();
    return MenuConfigResponse.fromJson(json);
  }

  Future<Map<String, dynamic>> loadMenuConfigByRole(String endPoint) async {
    final json = await apiService.get(endPoint);
    return json;
  }
}
