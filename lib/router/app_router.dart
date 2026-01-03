import 'package:go_router/go_router.dart';
import 'package:medicque_app/features/auth/admin/presentation/common/admin_login_router.dart';
import 'package:medicque_app/features/auth/doctor/presentation/common/doctor_login_router.dart';
import 'package:medicque_app/features/auth/patient/presentation/common/patient_login_router.dart'
    show PatientLoginRouter;
import 'package:medicque_app/features/patient/dashboard/presentation/common/p_my_appointment_details_router.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/common/p_my_appointments_router.dart';
import 'package:medicque_app/features/patient/landing/presentation/common/patient_landing_router.dart';
import 'package:medicque_app/features/patient/search/presentation/common/search_router.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/common/slot_confirmation_router.dart';
import 'package:medicque_app/features/splash/splash_screen.dart';
import 'package:medicque_app/search/bokking/booking_flow_screen.dart';

import '../features/admin/dashboard/common/a_dashboard_router.dart';
import '../features/doctor/dashboard/common/d_dashboard_router.dart';
import '../features/patient/dashboard/presentation/common/p_dashboard_router.dart';
import '../features/patient/slot_managment/presentaion/common/slot_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (c, s) => const SplashScreen()),
      GoRoute(
        path: '/landing',
        builder: (c, s) => const PatientLandingRouter(),
      ),
      GoRoute(path: '/search', builder: (c, s) => const SearchRouter()), //
      GoRoute(
        path: '/book',
        builder: (c, s) => const BookingFlowScreen(),
      ), // BookingFlowScreen
      // Patient
      GoRoute(
        path: '/patient/login',
        builder: (c, s) => const PatientLoginRouter(),
      ),
      GoRoute(
        path: '/patient/dashboard',
        builder: (c, s) => const PatientDashboardRouter(),
        routes: [
          GoRoute(
            path: 'doctor_appointment', // ✅ FIXED
            builder: (context, state) => const SlotRouter(),
            routes: [
              GoRoute(
                path: 'slot-confirmation',
                builder: (context, state) => const SlotConfirmationRouter(),
              ),
            ],
          ),
          GoRoute(
            path: 'my_appointment',
            builder: (context, state) => const PMyAppointmentsRouter(),
            routes: [
              GoRoute(
                path: 'details',
                builder: (context, state) =>
                    const PMyAppointmentDetailsRouter(),
              ),
            ],
          ),
        ],
      ),

      // Doctor
      GoRoute(
        path: '/doctor/login',
        builder: (c, s) => const DoctorLoginRouter(),
      ),
      GoRoute(
        path: '/doctor/dashboard',
        builder: (c, s) => const DoctorDashboardRouter(),
      ),

      // Admin
      GoRoute(
        path: '/admin/login',
        builder: (c, s) => const AdminLoginRouter(),
      ),
      GoRoute(
        path: '/admin/dashboard',
        builder: (c, s) => const AdminDashboardRouter(),
      ),
    ],
  );
}
