import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/responsive_widget.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/screen/mobile/p_mobile_my_appointments.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/screen/tablet/p_tablet_my_appointments.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/screen/web/p_web_my_appointments.dart';

class PMyAppointmentsRouter extends StatelessWidget {
  const PMyAppointmentsRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: PMobileMyAppointments(),
      tablet: PTabletMyAppointments(),
      desktop: PWebMyAppointments(),
    );
  }
}
