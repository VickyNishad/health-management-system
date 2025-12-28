import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/responsive_widget.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/screen/mobile/p_mobile_doctor_appointment.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/screen/tablet/p_tablet_doctor_appointment.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/screen/web/p_web_doctor_appointment.dart';

class PDoctorAppointmentRouter extends StatelessWidget {
  const PDoctorAppointmentRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: PMobileDoctorAppointment(),
      tablet: PTabletDoctorAppointment(),
      desktop: PWebDoctorAppointment(),
    );
  }
}
