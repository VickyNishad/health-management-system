import 'package:equatable/equatable.dart';
import '../../config/menu_config_response.dart';

abstract class MenuState extends Equatable {
  const MenuState();
  @override
  List<Object?> get props => [];
}

class MenuInitial extends MenuState {
  const MenuInitial();
}

class MenuLoading extends MenuState {
  const MenuLoading();
}

class MenuLoaded extends MenuState {
  final MenuConfigResponse config;
  const MenuLoaded(this.config);
  @override
  List<Object?> get props => [config];
}

class MenuError extends MenuState {
  final String message;
  const MenuError(this.message);
  @override
  List<Object?> get props => [message];
}
