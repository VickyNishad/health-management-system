import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/responsive_widget.dart';
import 'package:medicque_app/features/patient/landing/presentation/screen/web/patient_landing_web.dart';

class PatientLandingRouter extends StatelessWidget {
  const PatientLandingRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: PatientLandingWeb(),
      tablet: PatientLandingWeb(),
      desktop: PatientLandingWeb(),
    );
  }
}
