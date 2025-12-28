import 'package:flutter/material.dart';
import '../../../../../../core/components/responsive_widget.dart';
import '../../../../../core/utils/app_roles.dart';
import '../../../../../router/portal_wrapper.dart';
import '../screen/mobile/mobile_patient_dashboard.dart';
import '../screen/tablet/tab_patient_dashboard.dart';
import '../screen/web/web_patient_dashboard.dart';

class PatientDashboardRouter extends StatelessWidget {
  const PatientDashboardRouter({super.key});
  @override
  Widget build(BuildContext context) {
    return PortalWrapper(
      showMenuInAppBar: true,
      appRole: AppRole.patient,
      child: ResponsiveWidget(
        mobile: MobilePatientDashboard(),
        tablet: PatientTabletDashboard(),
        desktop: PatientWebDashboard(),
      ),
    );
  }
}
