import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicque_app/core/components/prifile_image.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/widgets/medicque_footer.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/widgets/medique_service.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/widgets/three_step_card.dart';
import '../../../../../../core/widgets/gradiant_text.dart';
import '../../../data/models/doctor_model.dart';

class PatientWebDashboard extends StatelessWidget {
  PatientWebDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // print(selectedDate.day);
    return _buildUI(context);
  }

  final List<DoctorModel> doctors = [
    DoctorModel(
      imagePath: "assets/images/doctor_img.png",
      name: "Dr. Himesh Pathak",
      experience: "29 years experience overall",
      address: "Chembur, Mumbai, 400071",
      fee: "₹500 Consultation fee",
      rating: "4.2",
    ),
    DoctorModel(
      imagePath: "assets/images/doctor_img.png",
      name: "Dr. Anita Sharma",
      experience: "15 years experience overall",
      address: "Andheri, Mumbai, 400058",
      fee: "₹400 Consultation fee",
      rating: "4.6",
    ),
    DoctorModel(
      imagePath: "assets/images/doctor_img.png",
      name: "Dr. Kunal Mehra",
      experience: "10 years experience overall",
      address: "Bandra, Mumbai, 400050",
      fee: "₹600 Consultation fee",
      rating: "4.8",
    ),
  ];

  Widget _buildUI(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.deepPurple.shade200),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search by Doctors, Clinic, PinCode etc.",
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.deepPurple),
                  ],
                ),
              ),
            ),

            // const SizedBox(height: 40),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 435,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black),
              // ),
              child: Center(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // <-- Center vertically
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // <-- Center horizontally
                  children: [
                    const SizedBox(height: 40),
                    GradientText(
                      text: "3 Steps to Connect, Consult, and Care !",
                      style: TextStyle(
                        fontSize: 50.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      gradient: const LinearGradient(
                        colors: [Color(0x33745EDD), Color(0xCC745EDD)],
                      ),
                    ),

                    const SizedBox(height: 40),
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.end, // ⬇️ push Row to bottom
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // ⬅️ center horizontally
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceEvenly, // Center items in Row
                            children: [
                              ThreeStepCard(
                                imgPath: 'assets/images/3step_1.png',
                                title: "Search & Select",
                                number: 1,
                                subtitle:
                                    "Find and choose your Doctor with ease.",
                                titleFontSize: 22,
                                subtitleFontSize: 22,
                                imageSize: 120,
                              ),
                              const SizedBox(width: 100),
                              ThreeStepCard(
                                imgPath: 'assets/images/3step_2.png',
                                title: "Generate Token",
                                number: 2,
                                subtitle:
                                    "Generate your Doctor token instantly.",
                                titleFontSize: 22,
                                subtitleFontSize: 22,
                                imageSize: 120,
                                subtitleWidth: 243,
                              ),
                              const SizedBox(width: 40),
                              ThreeStepCard(
                                imgPath: 'assets/images/3step_3.png',
                                title: "Track queue",
                                number: 3,
                                subtitle:
                                    "Sit back, relax, and track your queue live.",
                                titleFontSize: 22,
                                subtitleFontSize: 22,
                                imageSize: 120,
                                subtitleWidth: 272,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                context.go('/patient/dashboard/doctor_appointment');
                // context.go('/');
              },
              child: const Text(
                "Your Health, Our Trusted Consultation",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Container(width: 140, height: 2, color: Colors.black),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MediqueService(
                      title: "Book Consultation",
                      assetImage: 'assets/images/consultation.png',
                      height: 350,
                      width: 100.87,
                      imgHeight: 200,
                      imgWidth: 200,
                      footerColor: Color(0XFF745EDD),
                      onTap: () {},
                    ),
                  ),

                  SizedBox(width: 30.w), // Responsive Spacing

                  Expanded(
                    child: MediqueService(
                      title: "Book Lab Test",
                      assetImage: 'assets/images/lab_test.png',
                      height: 350,
                      width: 230.87,
                      imgHeight: 200,
                      imgWidth: 200,
                      footerColor: Color(0XFF745EDD),
                      onTap: () {},
                    ),
                  ),

                  SizedBox(width: 30.w), // Responsive Spacing

                  Expanded(
                    child: MediqueService(
                      title: "Book Hospital Bed",
                      assetImage: 'assets/images/bed.png',
                      height: 350,
                      width: 230.87,
                      imgHeight: 200,
                      imgWidth: 200,
                      footerColor: Color(0XFF745EDD),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),
            _whyChooseUs(context),
            SizedBox(height: 40.h),
            MedicQueFooter(),
          ],
        ),
      ),
    );
  }

  Widget _whyChooseUs(BuildContext ctx) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 130.0.w),
      child: SizedBox(
        height: 1000.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Why Choose Us ?",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 5),
                Container(width: 180, height: 2, color: Colors.black),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // profile image
                        ProfileImage(
                          imagePath: 'assets/images/doctor_img.png',
                          isCircle: false,
                          size: 420,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Container(
                              height: 185.h,
                              width: 5.w,
                              color: Colors.black,
                            ),

                            //
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "For Patients",
                                    style: TextStyle(
                                      fontSize: 46.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0x66000000),
                                    ),
                                  ),
                                  Text(
                                    "No waiting",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Transparent Slot Bookings",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Access to Verified doctors",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 185.h,
                              width: 5.w,
                              color: Colors.black,
                            ),

                            //
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "For Clinics",
                                    style: TextStyle(
                                      fontSize: 46.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0x66000000),
                                    ),
                                  ),
                                  Text(
                                    "Queue Management",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Patient tracking",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Monetization tools",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        ProfileImage(
                          imagePath: 'assets/images/doctor_img.png',
                          isCircle: false,
                          size: 420,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Text("")
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:medicque_app/core/components/prifile_image.dart';
// import 'package:medicque_app/features/patient/dashboard/presentation/widgets/medicque_footer.dart';
// import 'package:medicque_app/features/patient/dashboard/presentation/widgets/medique_service.dart';
// import 'package:medicque_app/features/patient/dashboard/presentation/widgets/three_step_card.dart';
// import '../../../../../../core/widgets/gradiant_text.dart';
// import '../../../data/models/doctor_model.dart';

// class PatientWebDashboard extends StatelessWidget {
//   PatientWebDashboard({super.key});

//   final List<DoctorModel> doctors = [
//     DoctorModel(
//       imagePath: "assets/images/doctor_img.png",
//       name: "Dr. Himesh Pathak",
//       experience: "29 years experience overall",
//       address: "Chembur, Mumbai, 400071",
//       fee: "₹500 Consultation fee",
//       rating: "4.2",
//     ),
//     DoctorModel(
//       imagePath: "assets/images/doctor_img.png",
//       name: "Dr. Anita Sharma",
//       experience: "15 years experience overall",
//       address: "Andheri, Mumbai, 400058",
//       fee: "₹400 Consultation fee",
//       rating: "4.6",
//     ),
//     DoctorModel(
//       imagePath: "assets/images/doctor_img.png",
//       name: "Dr. Kunal Mehra",
//       experience: "10 years experience overall",
//       address: "Bandra, Mumbai, 400050",
//       fee: "₹600 Consultation fee",
//       rating: "4.8",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Ensure ScreenUtil is initialized above this widget in the widget tree.
//     final double screenWidth = MediaQuery.of(context).size.width;
//     // adaptive horizontal padding
//     final double horizontalPadding = screenWidth > 1200
//         ? 130.w
//         : screenWidth > 900
//         ? 80.w
//         : 20.w;

//     return Center(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 40.h),

//               // Search Box
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 0),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30.r),
//                     border: Border.all(color: Colors.deepPurple.shade200),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Search by Doctors, Clinic, PinCode etc.",
//                           ),
//                         ),
//                       ),
//                       Icon(Icons.search, color: Colors.deepPurple),
//                     ],
//                   ),
//                 ),
//               ),

//               SizedBox(height: 40.h),

//               // Three step section (responsive)
//               ConstrainedBox(
//                 constraints: BoxConstraints(minHeight: 300.h),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 20.h),
//                     GradientText(
//                       text: "3 Steps to Connect, Consult, and Care !",
//                       style: TextStyle(
//                         fontSize: 50.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       gradient: const LinearGradient(
//                         colors: [Color(0x33745EDD), Color(0xCC745EDD)],
//                       ),
//                     ),
//                     SizedBox(height: 30.h),

//                     // REPLACED Row with Wrap so it can flow on smaller screens
//                     LayoutBuilder(
//                       builder: (context, constraints) {
//                         // compute child width target (approx) to help Wrap sizing
//                         final double childMaxWidth = constraints.maxWidth > 1000
//                             ? (constraints.maxWidth / 3) - 60
//                             : constraints.maxWidth * 0.9;

//                         return Wrap(
//                           alignment: WrapAlignment.center,
//                           spacing: 40.w,
//                           runSpacing: 32.h,
//                           children: [
//                             ConstrainedBox(
//                               constraints: BoxConstraints(
//                                 maxWidth: childMaxWidth,
//                                 minWidth: 260.w,
//                               ),
//                               child: ThreeStepCard(
//                                 imgPath: 'assets/images/3step_1.png',
//                                 title: "Search & Select",
//                                 number: 1,
//                                 subtitle:
//                                     "Find and choose your Doctor with ease.",
//                                 titleFontSize: 22,
//                                 subtitleFontSize: 22,
//                                 imageSize: 120,
//                               ),
//                             ),
//                             ConstrainedBox(
//                               constraints: BoxConstraints(
//                                 maxWidth: childMaxWidth,
//                                 minWidth: 260.w,
//                               ),
//                               child: ThreeStepCard(
//                                 imgPath: 'assets/images/3step_2.png',
//                                 title: "Generate Token",
//                                 number: 2,
//                                 subtitle:
//                                     "Generate your Doctor token instantly.",
//                                 titleFontSize: 22,
//                                 subtitleFontSize: 22,
//                                 imageSize: 120,
//                                 subtitleWidth: 243,
//                               ),
//                             ),
//                             ConstrainedBox(
//                               constraints: BoxConstraints(
//                                 maxWidth: childMaxWidth,
//                                 minWidth: 260.w,
//                               ),
//                               child: ThreeStepCard(
//                                 imgPath: 'assets/images/3step_3.png',
//                                 title: "Track queue",
//                                 number: 3,
//                                 subtitle:
//                                     "Sit back, relax, and track your queue live.",
//                                 titleFontSize: 22,
//                                 subtitleFontSize: 22,
//                                 imageSize: 120,
//                                 subtitleWidth: 272,
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                     SizedBox(height: 24.h),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 40.h),

//               GestureDetector(
//                 onTap: () {
//                   context.go('/patient/dashboard/doctor_appointment');
//                 },
//                 child: const Text(
//                   "Your Health, Our Trusted Consultation",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 5.h),
//               Container(width: 140.w, height: 2.h, color: Colors.black),
//               SizedBox(height: 30.h),

//               // Services row — keep Expanded but ensure MediqueService internal widths are not fixed
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w),
//                 child: LayoutBuilder(
//                   builder: (context, constraints) {
//                     // If narrow screen, show vertical column
//                     final bool narrow = constraints.maxWidth < 900;
//                     if (narrow) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           MediqueService(
//                             title: "Book Consultation",
//                             assetImage: 'assets/images/consultation.png',
//                             height: 350.h,
//                             width: double.infinity,
//                             imgHeight: 200.h,
//                             imgWidth: 200.w,
//                             footerColor: const Color(0XFF745EDD),
//                             onTap: () {},
//                           ),
//                           SizedBox(height: 20.h),
//                           MediqueService(
//                             title: "Book Lab Test",
//                             assetImage: 'assets/images/lab_test.png',
//                             height: 350.h,
//                             width: double.infinity,
//                             imgHeight: 200.h,
//                             imgWidth: 200.w,
//                             footerColor: const Color(0XFF745EDD),
//                             onTap: () {},
//                           ),
//                           SizedBox(height: 20.h),
//                           MediqueService(
//                             title: "Book Hospital Bed",
//                             assetImage: 'assets/images/bed.png',
//                             height: 350.h,
//                             width: double.infinity,
//                             imgHeight: 200.h,
//                             imgWidth: 200.w,
//                             footerColor: const Color(0XFF745EDD),
//                             onTap: () {},
//                           ),
//                         ],
//                       );
//                     } else {
//                       // Desktop / wide screens — keep three in a row, but responsive
//                       return Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: MediqueService(
//                               title: "Book Consultation",
//                               assetImage: 'assets/images/consultation.png',
//                               height: 350.h,
//                               width: double.infinity,
//                               imgHeight: 200.h,
//                               imgWidth: 200.w,
//                               footerColor: const Color(0XFF745EDD),
//                               onTap: () {},
//                             ),
//                           ),
//                           SizedBox(width: 30.w),
//                           Expanded(
//                             child: MediqueService(
//                               title: "Book Lab Test",
//                               assetImage: 'assets/images/lab_test.png',
//                               height: 350.h,
//                               width: double.infinity,
//                               imgHeight: 200.h,
//                               imgWidth: 200.w,
//                               footerColor: const Color(0XFF745EDD),
//                               onTap: () {},
//                             ),
//                           ),
//                           SizedBox(width: 30.w),
//                           Expanded(
//                             child: MediqueService(
//                               title: "Book Hospital Bed",
//                               assetImage: 'assets/images/bed.png',
//                               height: 350.h,
//                               width: double.infinity,
//                               imgHeight: 200.h,
//                               imgWidth: 200.w,
//                               footerColor: const Color(0XFF745EDD),
//                               onTap: () {},
//                             ),
//                           ),
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ),

//               SizedBox(height: 40.h),

//               // WHY CHOOSE US section — make responsive: Wrap to avoid overflow
//               _whyChooseUs(context),

//               SizedBox(height: 40.h),

//               // Footer
//               MedicQueFooter(),

//               SizedBox(height: 40.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _whyChooseUs(BuildContext ctx) {
//     final double screenWidth = MediaQuery.of(ctx).size.width;
//     final double blockImageSize = screenWidth > 1200
//         ? 420.w
//         : screenWidth > 900
//         ? 320.w
//         : 220.w;

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.w),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(minHeight: 300.h),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Column(
//               children: [
//                 Text(
//                   "Why Choose Us ?",
//                   style: TextStyle(
//                     fontSize: 24.sp,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Container(width: 180.w, height: 2.h, color: Colors.black),
//               ],
//             ),
//             SizedBox(height: 24.h),

//             // Use Wrap to flow left & right blocks on smaller screens
//             LayoutBuilder(
//               builder: (context, constraints) {
//                 final bool narrow = constraints.maxWidth < 900;
//                 if (narrow) {
//                   // vertical layout
//                   return Column(
//                     children: [
//                       _whyChooseBlock(
//                         ctx,
//                         title: "For Patients",
//                         subItems: const [
//                           "No waiting",
//                           "Transparent Slot Bookings",
//                           "Access to Verified doctors",
//                         ],
//                         imageSize: blockImageSize,
//                       ),
//                       SizedBox(height: 30.h),
//                       _whyChooseBlock(
//                         ctx,
//                         title: "For Clinics",
//                         subItems: const [
//                           "Queue Management",
//                           "Patient tracking",
//                           "Monetization tools",
//                         ],
//                         imageSize: blockImageSize,
//                         reverse: true,
//                       ),
//                     ],
//                   );
//                 } else {
//                   // horizontal side-by-side
//                   return Wrap(
//                     alignment: WrapAlignment.spaceEvenly,
//                     spacing: 40.w,
//                     runSpacing: 20.h,
//                     children: [
//                       SizedBox(
//                         width: (constraints.maxWidth / 2) - 40,
//                         child: _whyChooseBlock(
//                           ctx,
//                           title: "For Patients",
//                           subItems: const [
//                             "No waiting",
//                             "Transparent Slot Bookings",
//                             "Access to Verified doctors",
//                           ],
//                           imageSize: blockImageSize,
//                         ),
//                       ),
//                       SizedBox(
//                         width: (constraints.maxWidth / 2) - 40,
//                         child: _whyChooseBlock(
//                           ctx,
//                           title: "For Clinics",
//                           subItems: const [
//                             "Queue Management",
//                             "Patient tracking",
//                             "Monetization tools",
//                           ],
//                           imageSize: blockImageSize,
//                           reverse: true,
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _whyChooseBlock(
//     BuildContext ctx, {
//     required String title,
//     required List<String> subItems,
//     required double imageSize,
//     bool reverse = false,
//   }) {
//     final textColumn = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 46.sp,
//             fontWeight: FontWeight.w400,
//             color: const Color(0x66000000),
//           ),
//         ),
//         SizedBox(height: 8.h),
//         for (var item in subItems)
//           Text(
//             item,
//             style: TextStyle(
//               fontSize: 24.sp,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ),
//           ),
//       ],
//     );

//     final imageColumn = Column(
//       children: [
//         ProfileImage(
//           imagePath: 'assets/images/doctor_img.png',
//           isCircle: false,
//           size: imageSize,
//         ),
//       ],
//     );

//     // left bar + details column
//     final details = Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(height: 185.h, width: 5.w, color: Colors.black),
//         Padding(padding: EdgeInsets.all(8.0.w), child: textColumn),
//       ],
//     );

//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.h),
//       child: reverse
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 details,
//                 SizedBox(height: 20.h),
//                 imageColumn,
//               ],
//             )
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 imageColumn,
//                 SizedBox(height: 20.h),
//                 details,
//               ],
//             ),
//     );
//   }
// }
