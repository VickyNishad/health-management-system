import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/responsive_widget.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/screen/mobile/p_mobile_doctor_appointment_booking.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/screen/tablet/p_tablet_doctor_appointment_booking.dart';

import '../screen/web/p_doctor_appointment_booking_web.dart';

class PDoctorAppointmentBookingRouter extends StatelessWidget {
  const PDoctorAppointmentBookingRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: PMobileDoctorAppointmentBooking(),
      tablet: PTabletDoctorAppointmentBooking(),
      desktop: PDoctorAppointmentBookingWeb(),
    );
  }
}
