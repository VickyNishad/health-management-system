import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/services/auth_service.dart';
import '../../router/portal_detector.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _boot();
  }

  Future<void> _boot() async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    final portal = PortalDetector.detect();
    final logged = await AuthService.isLoggedIn();
    final role = await AuthService.getRole();

    if (!mounted) return;

    if (logged && role != null) {
      // context.read<MenuBloc>().add(LoadMenuByRoleEvent(role));
      switch (role) {
        case 'patient':
          context.go('/patient/dashboard');
          return;
        case 'doctor':
          context.go('/doctor/dashboard');
          return;
        case 'admin':
          context.go('/admin/dashboard');
          return;
        default:
          context.go('/patient/login');
          return;
      }
    }

    switch (portal) {
      case PortalType.patient:
        context.go('/landing');
        // context.read<MenuBloc>().add(LoadMenuByRoleEvent('doctor'));
        // context.go('/doctor/dashboard');
        break;
      case PortalType.doctor:
        // context.go('/doctor/login');
        // context.read<MenuBloc>().add(LoadMenuByRoleEvent('doctor'));
        context.go('/doctor/dashboard');
        break;
      case PortalType.admin:
        // context.read<MenuBloc>().add(LoadMenuByRoleEvent('admin'));
        context.go('/admin/login');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
