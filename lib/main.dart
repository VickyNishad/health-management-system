import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicque_app/app.dart';
import 'package:medicque_app/core/provider/app_providers.dart';
import 'package:medicque_app/core/services/api_service.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signin/signin_bloc.dart';
import 'package:medicque_app/features/auth/bloc/form_bloc/signup/signup_bloc.dart'
    show SignUpBloc;

import 'core/bloc/menu/menu_bloc.dart';
import 'core/bloc/menu_event.dart';
import 'core/repository/menu_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final menuRepository = MenuRepository(apiService: ApiService());

  runApp(
    MultiRepositoryProvider(
      providers: [
        ...AppProviders.repositories, // <-- Add repositories
      ],
      child: MultiBlocProvider(
        providers: [
          ...AppProviders.blocs, // <-- Add AuthBloc here
          BlocProvider<MenuBloc>(
            create: (_) =>
                MenuBloc(repository: menuRepository)..add(const LoadMenu()),
          ),

          BlocProvider(create: (_) => SignUpBloc()),

          BlocProvider(create: (_) => SigninBloc()),
        ],
        child: const App(),
      ),
    ),
  );
}
