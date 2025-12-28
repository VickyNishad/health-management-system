import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/prifile_image.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/account/account_section.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/appointments/appointments.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/appointments/recent_appointment.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/appointments/upcomming_appointments.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/availability/availabale_time.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/dashboard/stat_card.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/dashboard/weekly_overview_chart.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/invoice/invoices_page.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/invoice/recent_invoice.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/notification/notification.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/patients/app_patients.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/patients/recent_patients.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/requested/requests_page.dart';

import 'package:medicque_app/features/doctor/dashboard/widgets/side_menu_item.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/topbar/dashboard_top_bar.dart';

class DoctorDashboardWeb extends StatefulWidget {
  const DoctorDashboardWeb({super.key});

  @override
  State<DoctorDashboardWeb> createState() => _DoctorDashboardWebState();
}

class _DoctorDashboardWebState extends State<DoctorDashboardWeb> {
  String _selectedMenu = "Dashboard";

  // Logic: Swaps the entire view based on the selected menu
  Widget _buildBodyContent() {
    switch (_selectedMenu) {
      case "Dashboard":
        return _buildDashboardGrid();
      case "Requests":
        return const RequestsPage(); // Separate Widget
      case "Available Timings":
        return const AvailableTimingsPage();
      case "Appointments":
        return const AppointmentsPage(); // Separate Widget
      case "My Patients":
        return const MyPatientsPage(); // Separate Widget
      case "Invoices":
        return const InvoicesPage(); // Separate Widget
      case "Accounts":
        return const AccountSection();
      default:
        return Center(
          child: Text(
            "$_selectedMenu Coming Soon...",
            style: const TextStyle(fontSize: 24, color: Colors.blueGrey),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FE),
      body: Row(
        children: [
          _buildSidebar(context),
          Expanded(
            child: Column(
              children: [
                DashboardTopBar(
                  title: _selectedMenu,
                  avatarUrl: 'https://i.pravatar.cc/150?img=11',
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(25),
                    child: _buildBodyContent(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- MAIN DASHBOARD GRID ---
  Widget _buildDashboardGrid() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  StatCard(
                    title: "Total Patient",
                    value: "978",
                    statusText: "15% From Last Week",
                    icon: Icons.person_add_alt_1,
                    statusColor: Colors.green,
                    isUp: true,
                    // statusText: '',
                  ),
                  SizedBox(height: 15),
                  StatCard(
                    title: "Patients Today",
                    value: "80",
                    statusText: "15% From Yesterday",
                    icon: Icons.group,
                    statusColor: Colors.red,
                    isUp: false,
                    // statusText: '',
                  ),
                  SizedBox(height: 15),
                  StatCard(
                    title: "Appointments Today",
                    value: "50",
                    statusText: "20% From Yesterday",
                    icon: Icons.calendar_month,
                    statusColor: Colors.green,
                    isUp: true,
                    // statusText: '',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 25),
            const Expanded(flex: 2, child: RecentAppointment()),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 1, child: WeeklyOverviewChart()),
            const SizedBox(width: 25),
            Expanded(flex: 1, child: UpcommingAppointments()),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const RecentPatients(),
                  const SizedBox(height: 25),
                  const NotificationsList(),
                ],
              ),
            ),
            const SizedBox(width: 25),
            const Expanded(flex: 1, child: RecentInvoices()),
          ],
        ),
      ],
    );
  }

  // --- SIDEBAR ---
  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 40),

          // const CircleAvatar(
          //   radius: 40,
          //   backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
          // ),
          ProfileImage(
            imagePath: "assets/images/doctor_img.png",
            isCircle: true,
            size: 100,
          ),
          const SizedBox(height: 10),
          const Text(
            "Dr. Edalin Hendry",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
            "BDS, MDS - Oral Surgery",
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                SideMenuItem(
                  icon: Icons.grid_view_rounded,
                  label: 'Dashboard',
                  isActive: _selectedMenu == 'Dashboard',
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'Dashboard';
                    });
                  },
                ),
                SideMenuItem(
                  icon: Icons.mail_outline,
                  label: 'Requests',
                  isActive: _selectedMenu == 'Requests',
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'Requests';
                    });
                  },
                ),

                SideMenuItem(
                  icon: Icons.time_to_leave_sharp,
                  label: 'Available Timings',
                  isActive: _selectedMenu == 'Available Timings',
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'Available Timings';
                    });
                  },
                ),

                SideMenuItem(
                  icon: Icons.calendar_today,
                  label: 'Appointments',
                  isActive: _selectedMenu == 'Appointments',
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'Appointments';
                    });
                  },
                ),

                SideMenuItem(
                  icon: Icons.people_outline,
                  label: 'My Patients',
                  isActive: _selectedMenu == 'My Patients',
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'My Patients';
                    });
                  },
                ),

                SideMenuItem(
                  icon: Icons.receipt_long,
                  label: 'Invoices',
                  isActive: _selectedMenu == 'Invoices',
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'Invoices';
                    });
                  },
                ),

                SideMenuItem(
                  icon: Icons.account_balance,
                  label: 'Accounts',
                  isActive: _selectedMenu == 'Accounts',
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'Accounts';
                    });
                  },
                ),

                SideMenuItem(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  isActive: _selectedMenu == 'Settings',
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'Settings';
                    });
                  },
                ),

                SideMenuItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  isActive: _selectedMenu == 'Logout',
                  activeColor: Colors.red,
                  onTap: () {
                    setState(() {
                      _selectedMenu = 'Logout';
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
