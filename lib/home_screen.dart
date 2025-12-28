// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // // --- DATA MODEL (Defined here for simplicity and accessibility) ---
// // class Doctor {
// //   final String name;
// //   final String specialty;
// //   final double rating;
// //   final IconData icon;

// //   const Doctor(this.name, this.specialty, this.rating, this.icon);
// // }

// // // --- HOME SCREEN ---

// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});

// //   final List<Doctor> popularDoctors = const [
// //     // ... doctor data ...
// //     Doctor("Dr. John Smith", "Dermatologist", 4.9, Icons.person_3_outlined),
// //     Doctor("Dr. Anna Dinn", "Psychologist", 4.9, Icons.psychology_outlined),
// //     Doctor(
// //       "Dr. Angela Rayez",
// //       "Therapist",
// //       4.8,
// //       Icons.self_improvement_outlined,
// //     ),
// //     Doctor("Dr. Chris Bronte", "Dentist", 5.0, Icons.sick_outlined),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     // 🔑 THE FIX: Initialize ScreenUtil using the context
// //     // This explicitly connects the ScreenUtil data to the context
// //     // before any .w/.h extensions are used.
// //     ScreenUtil.init(context);
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SafeArea(
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 20.w),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               SizedBox(height: 20.h),
// //               _buildHeader(),
// //               SizedBox(height: 30.h),
// //               _buildSearchBar(),
// //               SizedBox(height: 30.h),
// //               Text(
// //                 "Let's find your doctor",
// //                 style: TextStyle(
// //                   fontSize: 20.sp,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black87,
// //                 ),
// //               ),
// //               SizedBox(height: 15.h),
// //               _buildDoctorGrid(context),
// //               SizedBox(height: 30.h),
// //               Text(
// //                 "What are you symptoms?",
// //                 style: TextStyle(
// //                   fontSize: 20.sp,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black87,
// //                 ),
// //               ),
// //               SizedBox(height: 15.h),
// //               _buildSymptomList(),
// //               const Spacer(),
// //             ],
// //           ),
// //         ),
// //       ),
// //       bottomNavigationBar: _buildBottomNavBar(),
// //     );
// //   }

// //   Widget _buildHeader() {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               "Hello,",
// //               style: TextStyle(fontSize: 24.sp, color: Colors.black54),
// //             ),
// //             Text(
// //               "James Bennett",
// //               style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
// //             ),
// //           ],
// //         ),
// //         CircleAvatar(
// //           radius: 25.r,
// //           backgroundColor: Colors.grey.shade300,
// //           // Placeholder image (replace with actual asset if needed)
// //           child: Icon(Icons.person, size: 30.r, color: Colors.black54),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildSearchBar() {
// //     return Container(
// //       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
// //       decoration: BoxDecoration(
// //         color: Colors.grey.shade100,
// //         borderRadius: BorderRadius.circular(15.r),
// //       ),
// //       child: TextField(
// //         decoration: InputDecoration(
// //           hintText: "Search conditions, doctors...",
// //           hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
// //           border: InputBorder.none,
// //           prefixIcon: Icon(Icons.search, size: 22.r, color: Colors.grey),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDoctorGrid(BuildContext context) {
// //     return SizedBox(
// //       height: 200.h,
// //       child: GridView.builder(
// //         physics: const NeverScrollableScrollPhysics(),
// //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           childAspectRatio: 0.85,
// //           crossAxisSpacing: 15.w,
// //           mainAxisSpacing: 15.h,
// //         ),
// //         itemCount: popularDoctors.length,
// //         itemBuilder: (context, index) {
// //           final doctor = popularDoctors[index];
// //           return _buildDoctorCard(context, doctor);
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildDoctorCard(BuildContext context, Doctor doctor) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => DoctorDetailScreen(doctor: doctor),
// //           ),
// //         );
// //       },
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(15.r),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.grey.shade200,
// //               blurRadius: 10,
// //               offset: const Offset(0, 5),
// //             ),
// //           ],
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(doctor.icon, size: 40.r, color: Colors.black54),
// //             SizedBox(height: 10.h),
// //             Text(
// //               doctor.name,
// //               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 2.h),
// //             Text(
// //               doctor.specialty,
// //               style: TextStyle(fontSize: 12.sp, color: Colors.black54),
// //             ),
// //             SizedBox(height: 5.h),
// //             Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Icon(Icons.star, color: Colors.purple.shade400, size: 14.r),
// //                 Text(
// //                   doctor.rating.toString(),
// //                   style: TextStyle(
// //                     fontSize: 12.sp,
// //                     color: Colors.purple.shade400,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildSymptomList() {
// //     return Row(
// //       children: [
// //         _buildSymptomPill("Temperature", Icons.thermostat_outlined),
// //         SizedBox(width: 10.w),
// //         _buildSymptomPill("Sniffle", Icons.air_outlined),
// //       ],
// //     );
// //   }

// //   Widget _buildSymptomPill(String label, IconData icon) {
// //     return Container(
// //       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
// //       decoration: BoxDecoration(
// //         color: Colors.grey.shade100,
// //         borderRadius: BorderRadius.circular(10.r),
// //       ),
// //       child: Row(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Icon(icon, size: 18.r, color: Colors.black87),
// //           SizedBox(width: 5.w),
// //           Text(label, style: TextStyle(fontSize: 14.sp)),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildBottomNavBar() {
// //     return Container(
// //       height: 70.h,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         border: Border(
// //           top: BorderSide(color: Colors.grey.shade200, width: 1.h),
// //         ),
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //         children: [
// //           _buildNavItem(Icons.home, "Home", true),
// //           _buildNavItem(Icons.chat_bubble_outline, "Messages", false),
// //           _buildNavItem(Icons.schedule, "Schedule", false),
// //           _buildNavItem(Icons.settings, "Settings", false),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildNavItem(IconData icon, String label, bool isActive) {
// //     Color color = isActive ? Colors.deepPurple : Colors.grey;
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         Icon(icon, color: color, size: 24.r),
// //         SizedBox(height: 4.h),
// //         Text(
// //           label,
// //           style: TextStyle(fontSize: 10.sp, color: color),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // // --- DOCTOR DETAIL SCREEN ---

// // class DoctorDetailScreen extends StatelessWidget {
// //   final Doctor doctor;

// //   const DoctorDetailScreen({super.key, required this.doctor});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Stack(
// //         children: [
// //           // Purple Background Header
// //           Container(
// //             height: MediaQuery.of(context).size.height * 0.35,
// //             decoration: BoxDecoration(
// //               color: Colors.deepPurple.shade300,
// //               borderRadius: BorderRadius.only(
// //                 bottomLeft: Radius.circular(30.r),
// //                 bottomRight: Radius.circular(30.r),
// //               ),
// //             ),
// //           ),
// //           // Scrollable Content
// //           SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 SizedBox(height: 40.h),
// //                 _buildTopBar(context),
// //                 SizedBox(height: 10.h),
// //                 _buildDoctorProfileCard(),
// //                 Padding(
// //                   padding: EdgeInsets.symmetric(horizontal: 20.w),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       SizedBox(height: 30.h),
// //                       _buildBiography(),
// //                       SizedBox(height: 30.h),
// //                       _buildLocation(),
// //                       SizedBox(height: 100.h),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           // Floating "Book an Appointment" Button
// //           Align(
// //             alignment: Alignment.bottomCenter,
// //             child: Padding(
// //               padding: EdgeInsets.only(bottom: 25.h, left: 20.w, right: 20.w),
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   // Booking logic
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.deepPurple.shade400,
// //                   minimumSize: Size(double.infinity, 55.h),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(15.r),
// //                   ),
// //                 ),
// //                 child: Text(
// //                   "BOOK AN APPOINTMENT",
// //                   style: TextStyle(
// //                     fontSize: 16.sp,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTopBar(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(horizontal: 15.w),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           IconButton(
// //             icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 24.r),
// //             onPressed: () => Navigator.pop(context),
// //           ),
// //           Row(
// //             children: [
// //               _buildIconWrapper(Icons.star),
// //               SizedBox(width: 10.w),
// //               _buildIconWrapper(Icons.more_vert),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildIconWrapper(IconData icon) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         shape: BoxShape.circle,
// //         color: Colors.white.withOpacity(0.2),
// //       ),
// //       child: Padding(
// //         padding: EdgeInsets.all(5.r),
// //         child: Icon(icon, color: Colors.white, size: 22.r),
// //       ),
// //     );
// //   }

// //   Widget _buildDoctorProfileCard() {
// //     return Center(
// //       child: Container(
// //         width: 335.w,
// //         padding: EdgeInsets.all(20.r),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(20.r),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.05),
// //               blurRadius: 15,
// //               offset: const Offset(0, 8),
// //             ),
// //           ],
// //         ),
// //         child: Column(
// //           children: [
// //             CircleAvatar(
// //               radius: 40.r,
// //               backgroundColor: Colors.deepPurple.shade100,
// //               child: Icon(
// //                 doctor.icon,
// //                 size: 45.r,
// //                 color: Colors.deepPurple.shade400,
// //               ),
// //             ),
// //             SizedBox(height: 10.h),
// //             Text(
// //               doctor.name,
// //               style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 5.h),
// //             Text(
// //               doctor.specialty,
// //               style: TextStyle(
// //                 fontSize: 16.sp,
// //                 color: Colors.deepPurple.shade400,
// //                 fontWeight: FontWeight.w500,
// //               ),
// //             ),
// //             SizedBox(height: 5.h),
// //             Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Icon(Icons.star, color: Colors.orange, size: 16.r),
// //                 SizedBox(width: 5.w),
// //                 Text(
// //                   doctor.rating.toString(),
// //                   style: TextStyle(fontSize: 14.sp, color: Colors.orange),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 15.h),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 _buildActionButton(Icons.call_outlined),
// //                 SizedBox(width: 15.w),
// //                 _buildActionButton(Icons.chat_bubble_outline),
// //                 SizedBox(width: 15.w),
// //                 _buildActionButton(Icons.videocam_outlined),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildActionButton(IconData icon) {
// //     return Container(
// //       padding: EdgeInsets.all(12.r),
// //       decoration: BoxDecoration(
// //         color: Colors.deepPurple.shade50,
// //         shape: BoxShape.circle,
// //       ),
// //       child: Icon(icon, color: Colors.deepPurple, size: 24.r),
// //     );
// //   }

// //   Widget _buildBiography() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           "Biography",
// //           style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 10.h),
// //         Text.rich(
// //           TextSpan(
// //             text:
// //                 "Dr. John Smith is a Dermatologist with 10 years of experience. He is specialized in the ",
// //             style: TextStyle(fontSize: 14.sp, height: 1.5),
// //             children: [
// //               TextSpan(
// //                 text: "...Read more",
// //                 style: TextStyle(
// //                   color: Colors.deepPurple,
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 14.sp,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildLocation() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           "Location",
// //           style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 10.h),
// //         Text(
// //           "500 Liberty St, Oregon(OR), 97520",
// //           style: TextStyle(fontSize: 14.sp, color: Colors.black54),
// //         ),
// //         SizedBox(height: 10.h),
// //         ClipRRect(
// //           borderRadius: BorderRadius.circular(10.r),
// //           child: Container(
// //             height: 150.h,
// //             color: Colors.grey.shade200,
// //             child: Center(
// //               child: Text(
// //                 "Map View Placeholder",
// //                 style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medicque_app/doctor_detail_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFECE6FF),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 12),
//             _header(),
//             _searchBar(),
//             _title("Let’s find your doctor"),
//             _doctorGrid(context),
//             _title("What are you symptoms?"),
//             _symptoms(),
//             const Spacer(),
//             _bottomNav(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _header() => Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20.w),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Hello,", style: TextStyle(fontSize: 18.sp)),
//             Text(
//               "James Bennett",
//               style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         const CircleAvatar(
//           backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=1"),
//         ),
//       ],
//     ),
//   );

//   Widget _searchBar() => Padding(
//     padding: EdgeInsets.all(20.w),
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: 15.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15.r),
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: "Search conditions, doctors...",
//           border: InputBorder.none,
//           icon: const Icon(Icons.search),
//         ),
//       ),
//     ),
//   );

//   Widget _title(String text) => Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20.w),
//     child: Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
//       ),
//     ),
//   );

//   Widget _doctorGrid(BuildContext context) => Padding(
//     padding: EdgeInsets.all(16.w),
//     child: GridView.count(
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       mainAxisSpacing: 12,
//       crossAxisSpacing: 12,
//       childAspectRatio: .9,
//       children: const [
//         _DoctorCard("Dr. John Smith", "Dermatologist", "4.9"),
//         _DoctorCard("Dr. Anna Dinn", "Psychologist", "4.9"),
//         _DoctorCard("Dr. Angela Rayez", "Therapist", "4.8"),
//         _DoctorCard("Dr. Chris Bronte", "Dentist", "5.0"),
//       ],
//     ),
//   );

//   Widget _symptoms() => Padding(
//     padding: EdgeInsets.all(20.w),
//     child: Row(
//       children: [
//         _symptom("Temperature"),
//         const SizedBox(width: 10),
//         _symptom("Sniffle"),
//       ],
//     ),
//   );

//   Widget _symptom(String text) => Container(
//     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20.r),
//     ),
//     child: Text(text),
//   );

//   Widget _bottomNav() => Container(
//     height: 70.h,
//     color: Colors.white,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: const [
//         Icon(Icons.home, color: Colors.deepPurple),
//         Icon(Icons.message),
//         Icon(Icons.calendar_today),
//         Icon(Icons.settings),
//       ],
//     ),
//   );
// }

// class _DoctorCard extends StatelessWidget {
//   final String name, role, rating;

//   const _DoctorCard(this.name, this.role, this.rating);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) =>
//                 DoctorDetailScreen(name: name, specialty: role, rating: rating),
//           ),
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.all(12.w),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const CircleAvatar(radius: 30),
//             const SizedBox(height: 10),
//             Text(
//               name,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             Text(role, style: const TextStyle(color: Colors.grey)),
//             const SizedBox(height: 5),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 "⭐ $rating",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'doctor_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE6FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              _searchBar(),
              _title("Let’s find your doctor"),
              _doctorGrid(context),
              _title("What are your symptoms?"),
              _symptoms(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _header() => Padding(
    padding: EdgeInsets.all(20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello,", style: TextStyle(fontSize: 16.sp)),
            Text(
              "James Bennett",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=1"),
        ),
      ],
    ),
  );

  Widget _searchBar() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search conditions, doctors...",
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    ),
  );

  Widget _title(String text) => Padding(
    padding: EdgeInsets.all(20.w),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
    ),
  );

  Widget _doctorGrid(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true, // ✅ FIXED FOR WEB
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: .9,
      children: [
        _DoctorCard(context, "Dr. John Smith", "Dermatologist", "4.9"),
        _DoctorCard(context, "Dr. Anna Dinn", "Psychologist", "4.9"),
        _DoctorCard(context, "Dr. Angela Rayez", "Therapist", "4.8"),
        _DoctorCard(context, "Dr. Chris Bronte", "Dentist", "5.0"),
      ],
    ),
  );

  Widget _symptoms() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      children: [
        _symptom("Temperature"),
        const SizedBox(width: 10),
        _symptom("Sniffle"),
      ],
    ),
  );

  Widget _symptom(String text) => Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Text(text),
  );

  Widget _bottomNav() => Container(
    height: 70.h,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(Icons.home, color: Colors.deepPurple),
        Icon(Icons.message),
        Icon(Icons.calendar_today),
        Icon(Icons.settings),
      ],
    ),
  );
}

class _DoctorCard extends StatelessWidget {
  final BuildContext context;
  final String name, role, rating;

  const _DoctorCard(this.context, this.name, this.role, this.rating);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              DoctorDetailScreen(name: name, specialty: role, rating: rating),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 30),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(role, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "⭐ $rating",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
