import 'package:flutter/material.dart';
import '../../../../../core/components/responsive_widget.dart';
import '../mobile/d_dashboard_mobile.dart';
import '../tablet/d_dashboard_tablet.dart';
import '../web/d_dashboard_web.dart';

class DoctorDashboardRouter extends StatelessWidget {
  const DoctorDashboardRouter({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: const DoctorDashboardMobile(),
      tablet: const DoctorDashboardTablet(),
      desktop: const DoctorDashboardWeb(),
    );
  }
}
