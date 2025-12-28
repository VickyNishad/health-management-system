import 'package:flutter/material.dart';
import '../../../../../core/components/responsive_widget.dart';
import '../mobile/a_dashboard_mobile.dart';

import '../tablet/a_dashboard_tablet.dart';
import '../web/a_dashboard_web.dart';

class AdminDashboardRouter extends StatelessWidget {
  const AdminDashboardRouter({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: const AdminDashboardMobile(),
      tablet: const AdminDashboardTablet(),
      desktop: const AdminDashboardWeb(),
    );
  }
}
