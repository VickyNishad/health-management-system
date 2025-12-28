// lib/core/providers.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicque_app/core/bloc/menu/menu_bloc.dart';
import 'package:medicque_app/core/bloc/menu/new_menu_bloc.dart';
import 'package:medicque_app/core/repository/menu_repository.dart';
import 'package:medicque_app/core/repository/new_menu_repo_impl.dart';
import 'package:medicque_app/features/auth/bloc/auth_bloc.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../services/api_service.dart';

class AppProviders {
  /// Repositories
  static List<RepositoryProvider> repositories = [
    RepositoryProvider<ApiService>(create: (_) => ApiService()),

    RepositoryProvider<AuthRepositoryImpl>(
      create: (context) =>
          AuthRepositoryImpl(apiService: context.read<ApiService>()),
    ),

    RepositoryProvider<NewMenuRepoImpl>(
      create: (context) =>
          NewMenuRepoImpl(apiService: context.read<ApiService>()),
    ),
  ];

  /// Blocs
  static List<BlocProvider> blocs = [
    BlocProvider<AuthBloc>(
      create: (context) =>
          AuthBloc(authRepositories: context.read<AuthRepositoryImpl>()),
    ),

    BlocProvider(
      create: (context) =>
          NewMenuBloc(newMenuRepoImpl: context.read<NewMenuRepoImpl>()),
    ),

    BlocProvider<MenuBloc>(
      create: (context) => MenuBloc(repository: context.read<MenuRepository>()),
    ),
  ];
}
