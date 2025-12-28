import 'package:flutter/material.dart';
import '../../../../../core/components/responsive_widget.dart';
import '../screen/mobile/doctor_login_mobile.dart';
import '../screen/tablet/doctor_login_tablet.dart';
import '../screen/web/doctor_login_web.dart';

class DoctorLoginRouter extends StatelessWidget {
  const DoctorLoginRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: DoctorLoginMobile(),
      tablet: DoctorLoginTablet(),
      desktop: DoctorLoginWeb(),
    );
  }
}
