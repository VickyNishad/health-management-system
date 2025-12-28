import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/menu/menu_bloc.dart';
import '../bloc/menu/menu_state.dart';
import '../config/menu_config_response.dart';

typedef MenuWidgetBuilder =
    Widget Function(BuildContext context, MenuConfigResponse config);

class MenuConsumer extends StatelessWidget {
  final MenuBloc? bloc;
  final MenuWidgetBuilder builder;
  final Widget? loading;
  final Widget Function(BuildContext, String)? error;

  const MenuConsumer({
    super.key,
    required this.builder,
    this.bloc,
    this.loading,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is MenuLoading || state is MenuInitial) {
          return loading ?? const Center(child: CircularProgressIndicator());
        } else if (state is MenuLoaded) {
          return builder(context, state.config);
        } else if (state is MenuError) {
          if (error != null) {
            return error!(context, state.message);
          }
          return Center(child: Text('Menu load failed: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
