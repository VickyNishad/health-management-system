import 'package:flutter/material.dart';
import 'package:medicque_app/features/auth/admin/presentation/screen/mobile/admin_login_mobile.dart';
import 'package:medicque_app/features/auth/admin/presentation/screen/tablet/admin_login_tablet.dart';
import 'package:medicque_app/features/auth/admin/presentation/screen/web/admin_login_web.dart';
import '../../../../../core/components/responsive_widget.dart';

class AdminLoginRouter extends StatelessWidget {
  const AdminLoginRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: AdminLoginMobile(),
      tablet: AdminLoginTablet(),
      desktop: AdminLoginWeb(),
    );
  }
}
