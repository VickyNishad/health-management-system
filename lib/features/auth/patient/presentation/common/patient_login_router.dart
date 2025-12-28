import 'package:flutter/material.dart';
import '../../../../../core/components/responsive_widget.dart';
import '../screen/mobile/patient_login_mobile.dart';
import '../screen/tablet/patient_login_tablet.dart';
import '../screen/web/patient_login_web.dart';

class PatientLoginRouter extends StatelessWidget {
  const PatientLoginRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: PatientLoginMobile(),
      tablet: PatientLoginTablet(),
      desktop: PatientLoginWeb(),
    );
  }
}
