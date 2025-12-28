// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // import 'home_screen.dart'; // To access the Doctor model

// // // class DoctorDetailScreen extends StatelessWidget {
// // //   final Doctor doctor;

// // //   const DoctorDetailScreen({super.key, required this.doctor});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // The top part of the screen has a distinct purple background.
// // //     // The body uses a Stack to combine the header and the scrollable content.
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: Stack(
// // //         children: [
// // //           // --- Purple Background Header (Top 35% of the screen) ---
// // //           Container(
// // //             height: MediaQuery.of(context).size.height * 0.35,
// // //             decoration: BoxDecoration(
// // //               color: Colors.deepPurple.shade300,
// // //               borderRadius: BorderRadius.only(
// // //                 bottomLeft: Radius.circular(30.r),
// // //                 bottomRight: Radius.circular(30.r),
// // //               ),
// // //             ),
// // //           ),

// // //           // --- Scrollable Content ---
// // //           SingleChildScrollView(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 SizedBox(height: 40.h),
// // //                 // --- Top Bar (Back button and actions) ---
// // //                 _buildTopBar(context),
// // //                 SizedBox(height: 10.h),
// // //                 // --- Doctor Profile Card ---
// // //                 _buildDoctorProfileCard(),

// // //                 // --- Content Below Card ---
// // //                 Padding(
// // //                   padding: EdgeInsets.symmetric(horizontal: 20.w),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       SizedBox(height: 30.h),
// // //                       // --- Biography Section ---
// // //                       _buildBiography(),
// // //                       SizedBox(height: 30.h),
// // //                       // --- Location Section ---
// // //                       _buildLocation(),
// // //                       SizedBox(
// // //                         height: 100.h,
// // //                       ), // Extra space for the floating button
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),

// // //           // --- Floating "Book an Appointment" Button ---
// // //           Align(
// // //             alignment: Alignment.bottomCenter,
// // //             child: Padding(
// // //               padding: EdgeInsets.only(bottom: 25.h, left: 20.w, right: 20.w),
// // //               child: ElevatedButton(
// // //                 onPressed: () {
// // //                   // Handle appointment booking logic
// // //                 },
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: Colors.deepPurple.shade400,
// // //                   minimumSize: Size(
// // //                     double.infinity,
// // //                     55.h,
// // //                   ), // Responsive button size
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(15.r),
// // //                   ),
// // //                 ),
// // //                 child: Text(
// // //                   "BOOK AN APPOINTMENT",
// // //                   style: TextStyle(
// // //                     fontSize: 16.sp,
// // //                     fontWeight: FontWeight.bold,
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTopBar(BuildContext context) {
// // //     return Padding(
// // //       padding: EdgeInsets.symmetric(horizontal: 15.w),
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           IconButton(
// // //             icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 24.r),
// // //             onPressed: () => Navigator.pop(context),
// // //           ),
// // //           // Placeholder for Action Buttons (Star and More)
// // //           Row(
// // //             children: [
// // //               Container(
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   color: Colors.white.withOpacity(0.2),
// // //                 ),
// // //                 child: Padding(
// // //                   padding: EdgeInsets.all(5.r),
// // //                   child: Icon(Icons.star, color: Colors.white, size: 22.r),
// // //                 ),
// // //               ),
// // //               SizedBox(width: 10.w),
// // //               Container(
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   color: Colors.white.withOpacity(0.2),
// // //                 ),
// // //                 child: Padding(
// // //                   padding: EdgeInsets.all(5.r),
// // //                   child: Icon(Icons.more_vert, color: Colors.white, size: 22.r),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildDoctorProfileCard() {
// // //     return Center(
// // //       child: Container(
// // //         width: 335.w, // Responsive width
// // //         padding: EdgeInsets.all(20.r),
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(20.r),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black.withOpacity(0.05),
// // //               blurRadius: 15,
// // //               offset: const Offset(0, 8),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             // Doctor Icon/Image
// // //             CircleAvatar(
// // //               radius: 40.r,
// // //               backgroundColor: Colors.deepPurple.shade100,
// // //               child: Icon(
// // //                 doctor.icon,
// // //                 size: 45.r,
// // //                 color: Colors.deepPurple.shade400,
// // //               ),
// // //             ),
// // //             SizedBox(height: 10.h),
// // //             Text(
// // //               doctor.name,
// // //               style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
// // //             ),
// // //             SizedBox(height: 5.h),
// // //             Text(
// // //               doctor.specialty,
// // //               style: TextStyle(
// // //                 fontSize: 16.sp,
// // //                 color: Colors.deepPurple.shade400,
// // //                 fontWeight: FontWeight.w500,
// // //               ),
// // //             ),
// // //             SizedBox(height: 5.h),
// // //             Row(
// // //               mainAxisSize: MainAxisSize.min,
// // //               children: [
// // //                 Icon(Icons.star, color: Colors.orange, size: 16.r),
// // //                 SizedBox(width: 5.w),
// // //                 Text(
// // //                   doctor.rating.toString(),
// // //                   style: TextStyle(fontSize: 14.sp, color: Colors.orange),
// // //                 ),
// // //               ],
// // //             ),
// // //             SizedBox(height: 15.h),
// // //             // Actions Row (Call/Message/Video)
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 _buildActionButton(Icons.call_outlined),
// // //                 SizedBox(width: 15.w),
// // //                 _buildActionButton(Icons.chat_bubble_outline),
// // //                 SizedBox(width: 15.w),
// // //                 _buildActionButton(Icons.videocam_outlined),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildActionButton(IconData icon) {
// // //     return Container(
// // //       padding: EdgeInsets.all(12.r),
// // //       decoration: BoxDecoration(
// // //         color: Colors.deepPurple.shade50,
// // //         shape: BoxShape.circle,
// // //       ),
// // //       child: Icon(icon, color: Colors.deepPurple, size: 24.r),
// // //     );
// // //   }

// // //   Widget _buildBiography() {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Text(
// // //           "Biography",
// // //           style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
// // //         ),
// // //         SizedBox(height: 10.h),
// // //         Text.rich(
// // //           TextSpan(
// // //             text:
// // //                 "Dr. John Smith is a Dermatologist with 10 years of experience. He is specialized in the ",
// // //             style: TextStyle(fontSize: 14.sp, height: 1.5),
// // //             children: [
// // //               TextSpan(
// // //                 text: "...Read more",
// // //                 style: TextStyle(
// // //                   color: Colors.deepPurple,
// // //                   fontWeight: FontWeight.bold,
// // //                   fontSize: 14.sp,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildLocation() {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Text(
// // //           "Location",
// // //           style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
// // //         ),
// // //         SizedBox(height: 10.h),
// // //         Text(
// // //           "500 Liberty St, Oregon(OR), 97520",
// // //           style: TextStyle(fontSize: 14.sp, color: Colors.black54),
// // //         ),
// // //         SizedBox(height: 10.h),
// // //         // Placeholder for the Map image
// // //         ClipRRect(
// // //           borderRadius: BorderRadius.circular(10.r),
// // //           child: Container(
// // //             height: 150.h,
// // //             color: Colors.grey.shade200,
// // //             child: Center(
// // //               child: Text(
// // //                 "Map View Placeholder",
// // //                 style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // class DoctorDetailScreen extends StatelessWidget {
// //   final String name;
// //   final String specialty;
// //   final String rating;

// //   const DoctorDetailScreen({
// //     super.key,
// //     required this.name,
// //     required this.specialty,
// //     required this.rating,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFECE6FF),
// //       body: Stack(
// //         children: [
// //           // 🔹 Purple Header
// //           Container(
// //             height: 320.h,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               color: const Color(0xFFB59CFF),
// //               borderRadius: BorderRadius.only(
// //                 bottomLeft: Radius.circular(40.r),
// //                 bottomRight: Radius.circular(40.r),
// //               ),
// //             ),
// //           ),

// //           // 🔹 Content
// //           SafeArea(
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   _topBar(context),
// //                   SizedBox(height: 25.h),
// //                   _doctorCard(),
// //                   SizedBox(height: 25.h),
// //                   _biography(),
// //                   _location(),
// //                   SizedBox(height: 120.h),
// //                 ],
// //               ),
// //             ),
// //           ),

// //           // 🔹 Book Button
// //           Positioned(
// //             bottom: 20.h,
// //             left: 20.w,
// //             right: 20.w,
// //             child: ElevatedButton(
// //               onPressed: () {},
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color(0xFFB59CFF),
// //                 minimumSize: Size(double.infinity, 60.h),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(30.r),
// //                 ),
// //               ),
// //               child: Text(
// //                 "BOOK AN APPOINTMENT",
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 16.sp,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // ✅ TOP BAR
// //   Widget _topBar(BuildContext context) => Padding(
// //     padding: EdgeInsets.symmetric(horizontal: 16.w),
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         IconButton(
// //           icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 22.sp),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         Row(
// //           children: [
// //             _circleIcon(Icons.star),
// //             SizedBox(width: 10.w),
// //             _circleIcon(Icons.more_vert),
// //           ],
// //         ),
// //       ],
// //     ),
// //   );

// //   Widget _circleIcon(IconData icon) => Container(
// //     padding: EdgeInsets.all(8.r),
// //     decoration: BoxDecoration(
// //       color: Colors.white.withOpacity(.25),
// //       shape: BoxShape.circle,
// //     ),
// //     child: Icon(icon, color: Colors.white),
// //   );

// //   // ✅ DOCTOR CARD
// //   Widget _doctorCard() => Container(
// //     width: 340.w,
// //     padding: EdgeInsets.all(20.w),
// //     decoration: BoxDecoration(
// //       color: Colors.white,
// //       borderRadius: BorderRadius.circular(30.r),
// //     ),
// //     child: Column(
// //       children: [
// //         const CircleAvatar(
// //           radius: 40,
// //           backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=5"),
// //         ),
// //         SizedBox(height: 10.h),
// //         Text(
// //           name,
// //           style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
// //         ),
// //         Text(
// //           specialty,
// //           style: TextStyle(fontSize: 14.sp, color: const Color(0xFFB59CFF)),
// //         ),
// //         SizedBox(height: 6.h),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Icon(Icons.star, color: Colors.orange, size: 16),
// //             const SizedBox(width: 6),
// //             Text(
// //               rating,
// //               style: TextStyle(fontSize: 14.sp, color: Colors.orange),
// //             ),
// //           ],
// //         ),
// //         SizedBox(height: 16.h),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: const [
// //             _ActionIcon(Icons.call),
// //             _ActionIcon(Icons.message),
// //             _ActionIcon(Icons.videocam),
// //           ],
// //         ),
// //       ],
// //     ),
// //   );

// //   // ✅ BIOGRAPHY
// //   Widget _biography() => Padding(
// //     padding: EdgeInsets.symmetric(horizontal: 20.w),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           "Biography",
// //           style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 8.h),
// //         RichText(
// //           text: TextSpan(
// //             style: TextStyle(color: Colors.black87, fontSize: 14.sp),
// //             children: const [
// //               TextSpan(
// //                 text:
// //                     "Dr. John Smith is a Dermatologist with 10 years of experience. He is specialized in the ",
// //               ),
// //               TextSpan(
// //                 text: "Read more",
// //                 style: TextStyle(
// //                   color: Color(0xFFB59CFF),
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     ),
// //   );

// //   // ✅ LOCATION
// //   Widget _location() => Padding(
// //     padding: EdgeInsets.all(20.w),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           "Location",
// //           style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 6.h),
// //         const Text(
// //           "500 Liberty St, Oregon (OR), 97520",
// //           style: TextStyle(color: Colors.grey),
// //         ),
// //         SizedBox(height: 12.h),
// //         Container(
// //           height: 160.h,
// //           width: double.infinity,
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade300,
// //             borderRadius: BorderRadius.circular(16.r),
// //           ),
// //           child: const Center(child: Text("Map View")),
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // // ✅ ACTION ICON WIDGET
// // class _ActionIcon extends StatelessWidget {
// //   final IconData icon;
// //   const _ActionIcon(this.icon);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.all(14),
// //       decoration: const BoxDecoration(
// //         shape: BoxShape.circle,
// //         color: Color(0xFFF2EDFF),
// //       ),
// //       child: Icon(icon, color: Color(0xFFB59CFF)),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DoctorDetailScreen extends StatelessWidget {
//   final String name;
//   final String specialty;
//   final String rating;

//   const DoctorDetailScreen({
//     super.key,
//     required this.name,
//     required this.specialty,
//     required this.rating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFECE6FF),

//       // ✅ FIXED BOOK BUTTON
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.all(20.w),
//         child: SizedBox(
//           height: 60.h,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFB59CFF),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30.r),
//               ),
//             ),
//             child: Text(
//               "BOOK AN APPOINTMENT",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),

//       body: Column(
//         children: [
//           // ✅ FIXED HEADER + CARD
//           Stack(
//             children: [
//               Container(
//                 height: 260.h,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFB59CFF),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(40.r),
//                     bottomRight: Radius.circular(40.r),
//                   ),
//                 ),
//               ),

//               SafeArea(
//                 child: Column(
//                   children: [
//                     _topBar(context),
//                     SizedBox(height: 20.h),
//                     _doctorCard(), // ✅ FIXED CARD
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           // ✅ ONLY THIS PART SCROLLS
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(20.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _biography(),
//                   SizedBox(height: 30.h),
//                   _location(),
//                   SizedBox(height: 120.h),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ TOP BAR
//   Widget _topBar(BuildContext context) => Padding(
//     padding: EdgeInsets.symmetric(horizontal: 16.w),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 22.sp),
//           onPressed: () => Navigator.pop(context),
//         ),
//         Row(
//           children: [
//             _circleIcon(Icons.star),
//             SizedBox(width: 10.w),
//             _circleIcon(Icons.more_vert),
//           ],
//         ),
//       ],
//     ),
//   );

//   Widget _circleIcon(IconData icon) => Container(
//     padding: EdgeInsets.all(8.r),
//     decoration: BoxDecoration(
//       color: Colors.white.withOpacity(.25),
//       shape: BoxShape.circle,
//     ),
//     child: Icon(icon, color: Colors.white),
//   );

//   // ✅ FIXED DOCTOR CARD
//   Widget _doctorCard() => Container(
//     width: 340.w,
//     padding: EdgeInsets.all(20.w),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(30.r),
//     ),
//     child: Column(
//       children: [
//         const CircleAvatar(
//           radius: 40,
//           backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=5"),
//         ),
//         SizedBox(height: 10.h),
//         Text(
//           name,
//           style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           specialty,
//           style: TextStyle(fontSize: 14.sp, color: const Color(0xFFB59CFF)),
//         ),
//         SizedBox(height: 6.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.star, color: Colors.orange, size: 16),
//             const SizedBox(width: 6),
//             Text(
//               rating,
//               style: TextStyle(fontSize: 14.sp, color: Colors.orange),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: const [
//             _ActionIcon(Icons.call),
//             _ActionIcon(Icons.message),
//             _ActionIcon(Icons.videocam),
//           ],
//         ),
//       ],
//     ),
//   );

//   // ✅ BIOGRAPHY
//   Widget _biography() => Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         "Biography",
//         style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
//       ),
//       SizedBox(height: 8.h),
//       RichText(
//         text: TextSpan(
//           style: TextStyle(color: Colors.black87, fontSize: 14.sp),
//           children: const [
//             TextSpan(
//               text:
//                   "Dr. John Smith is a Dermatologist with 10 years of experience. He is specialized in the ",
//             ),
//             TextSpan(
//               text: "Read more",
//               style: TextStyle(
//                 color: Color(0xFFB59CFF),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );

//   // ✅ LOCATION
//   Widget _location() => Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         "Location",
//         style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
//       ),
//       SizedBox(height: 6.h),
//       const Text(
//         "500 Liberty St, Oregon (OR), 97520",
//         style: TextStyle(color: Colors.grey),
//       ),
//       SizedBox(height: 12.h),
//       Container(
//         height: 160.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.grey.shade300,
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         child: const Center(child: Text("Map View")),
//       ),
//     ],
//   );
// }

// // ✅ ACTION ICON
// class _ActionIcon extends StatelessWidget {
//   final IconData icon;
//   const _ActionIcon(this.icon);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Color(0xFFF2EDFF),
//       ),
//       child: Icon(icon, color: Color(0xFFB59CFF)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailScreen extends StatelessWidget {
  final String name;
  final String specialty;
  final String rating;

  const DoctorDetailScreen({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE6FF),
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 260.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB59CFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                        bottomRight: Radius.circular(40.r),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        _topBar(context),
                        SizedBox(height: 20.h),
                        _doctorCard(),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _biography(),
                      SizedBox(height: 30.h),
                      _location(),
                      SizedBox(height: 120.h),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ✅ FIXED BOOK BUTTON FOR WEB
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: SafeArea(
              child: SizedBox(
                height: 60.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB59CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "BOOK AN APPOINTMENT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 22.sp),
          onPressed: () => Navigator.pop(context),
        ),
        Row(
          children: [
            _circleIcon(Icons.star),
            SizedBox(width: 10.w),
            _circleIcon(Icons.more_vert),
          ],
        ),
      ],
    ),
  );

  Widget _circleIcon(IconData icon) => Container(
    padding: EdgeInsets.all(8.r),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.25),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: Colors.white),
  );

  Widget _doctorCard() => Container(
    width: 340.w,
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30.r),
    ),
    child: Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=5"),
        ),
        SizedBox(height: 10.h),
        Text(
          name,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          specialty,
          style: TextStyle(fontSize: 14.sp, color: const Color(0xFFB59CFF)),
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 16),
            const SizedBox(width: 6),
            Text(
              rating,
              style: TextStyle(fontSize: 14.sp, color: Colors.orange),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _ActionIcon(Icons.call),
            _ActionIcon(Icons.message),
            _ActionIcon(Icons.videocam),
          ],
        ),
      ],
    ),
  );

  Widget _biography() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Biography",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8.h),
      const Text(
        "Dr. John Smith is a Dermatologist with 10 years of experience.",
      ),
    ],
  );

  Widget _location() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Location",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
      const Text("500 Liberty St, Oregon (OR), 97520"),
      SizedBox(height: 12.h),
      Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: const Center(child: Text("Map View")),
      ),
    ],
  );
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  const _ActionIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF2EDFF),
      ),
      child: Icon(icon, color: Color(0xFFB59CFF)),
    );
  }
}
