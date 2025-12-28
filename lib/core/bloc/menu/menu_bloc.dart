import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicque_app/core/repository/menu_repository.dart';
import 'package:medicque_app/core/services/assets_json_loader.dart';
import '../../config/menu_config_response.dart';
import '../menu_event.dart';

import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  // 🔥 Cached config (static → survives hot reload)
  final MenuRepository repository;
  static MenuConfigResponse? _cachedConfig;

  MenuBloc({required this.repository}) : super(MenuInitial()) {
    on<LoadMenu>((event, emit) async {
      try {
        // If already loaded → return cached version instantly
        if (_cachedConfig != null) {
          emit(MenuLoaded(_cachedConfig!));
          return;
        }

        emit(MenuLoading());

        // Load JSON only 1 time
        final json = await AssetJsonLoader.loadJsonAsset("menu_config.json");
        final config = MenuConfigResponse.fromJson(json);

        // Cache it
        _cachedConfig = config;

        emit(MenuLoaded(config));
      } catch (e) {
        emit(MenuError(e.toString()));
      }
    });

    on<LoadMenuByRoleEvent>(loadMenuByRole);
  }

  Future<void> loadMenuByRole(
    LoadMenuByRoleEvent e,
    Emitter<MenuState> emit,
  ) async {
    try {
      String? role = e.role;
      final res = await repository.loadMenuConfigByRole(
        'http://localhost:8080/medicque/menu/$role',
      );
      final j = res['data'];
      print(j);
      final config1 = MenuConfigResponse.fromJson(res['data']);
      _cachedConfig = config1;
      emit(MenuLoaded(config1));
    } catch (e) {
      print(e.toString());
      emit(MenuError(e.toString()));
    }
  }
}
