import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicque_app/core/bloc/menu/menu_state.dart';
import 'package:medicque_app/core/bloc/menu_event.dart';
import 'package:medicque_app/core/config/menu_config_response.dart';
import 'package:medicque_app/core/repository/new_repo.dart';

class NewMenuBloc extends Bloc<MenuEvent, MenuState> {
  NewRepo newMenuRepoImpl;
  NewMenuBloc({required this.newMenuRepoImpl}) : super(MenuInitial()) {
    on<LoadMenuByRoleEvent>(loadMenuByRole);
  }

  Future<void> loadMenuByRole(
    LoadMenuByRoleEvent e,
    Emitter<MenuState> emit,
  ) async {
    try {
      final res = await newMenuRepoImpl.loadMenuByRole('');
      final config = MenuConfigResponse.fromJson(res);

      emit(MenuLoaded(config));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }
}
