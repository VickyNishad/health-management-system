import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicque_app/core/widgets/gradiant_text.dart' show GradientText;
import 'package:medicque_app/features/patient/dashboard/presentation/widgets/medicque_footer.dart';
import 'package:medicque_app/features/patient/dashboard/presentation/widgets/medique_service.dart';

import '../../../../../../core/components/prifile_image.dart';
import '../../../data/models/doctor_model.dart';
import '../../widgets/three_step_card.dart';

class PatientTabletDashboard extends StatelessWidget {
  PatientTabletDashboard({super.key});
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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

            // const SizedBox(height: 40),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 250,
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
                    // const SizedBox(height: 20),
                    GradientText(
                      text: "3 Steps to Connect, Consult, and Care !",
                      style: TextStyle(
                        fontSize: 24.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      gradient: const LinearGradient(
                        colors: [Color(0x33745EDD), Color(0xCC745EDD)],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.end, // ⬇️ push Row to bottom
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // ⬅️ center horizontally
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Center items in Row
                          children: [
                            ThreeStepCard(
                              imgPath: 'assets/images/3step_1.png',
                              title: "Search & Select",
                              number: 1,
                              subtitle:
                                  "Find and choose your Doctor with ease.",
                              titleFontSize: 18,
                              subtitleFontSize: 13,
                              imageSize: 62.21,
                              subtitleWidth: 100,
                            ),
                            // const SizedBox(width: 25),
                            ThreeStepCard(
                              imgPath: 'assets/images/3step_2.png',
                              title: "Generate Token",
                              number: 2,
                              subtitle: "Generate your Doctor token instantly.",
                              titleFontSize: 18,
                              subtitleFontSize: 13,
                              imageSize: 62.21,
                              subtitleWidth: 100,
                            ),
                            // const SizedBox(width: 20),
                            ThreeStepCard(
                              imgPath: 'assets/images/3step_3.png',
                              title: "Track queue",
                              number: 3,
                              subtitle:
                                  "Sit back, relax, and track your queue live.",
                              titleFontSize: 18,
                              subtitleFontSize: 13,
                              imageSize: 62.21,
                              subtitleWidth: 100,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MediqueService(
                    title: "Book Consultation",
                    assetImage: 'assets/images/consultation.png',
                    height: 200,
                    width: 200,
                    imgHeight: 90,
                    imgWidth: 90,
                    footerColor: Color(0XFF745EDD),
                    onTap: () {},
                  ),
                ),

                // SizedBox(width: 30.w), // Responsive Spacing
                Expanded(
                  child: MediqueService(
                    title: "Book Lab Test",
                    assetImage: 'assets/images/lab_test.png',
                    height: 200,
                    width: 200,
                    imgHeight: 90,
                    imgWidth: 90,
                    footerColor: Color(0XFF745EDD),
                    onTap: () {},
                  ),
                ),

                // SizedBox(width: 30.w), // Responsive Spacing
                Expanded(
                  child: MediqueService(
                    title: "Book Hospital Bed",
                    assetImage: 'assets/images/bed.png',
                    height: 200,
                    width: 200,
                    imgHeight: 90,
                    imgWidth: 90,
                    footerColor: Color(0XFF745EDD),
                    onTap: () {},
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),
            _whyChooseUs(context),
            SizedBox(height: 20.h),
            MedicQueFooter(),
          ],
        ),
      ),
    );
  }

  Widget _whyChooseUs(BuildContext ctx) {
    return SizedBox(
      height: 500.h,
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
              Container(width: 50, height: 2, color: Colors.black),
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
                        size: 200,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Container(
                            height: 90.h,
                            width: 3.w,
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
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0x66000000),
                                  ),
                                ),
                                Text(
                                  "No waiting",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Transparent Slot Bookings",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Access to Verified doctors",
                                  style: TextStyle(
                                    fontSize: 16.sp,
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
                            height: 90.h,
                            width: 3.w,
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
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0x66000000),
                                  ),
                                ),
                                Text(
                                  "Queue Management",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Patient tracking",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Monetization tools",
                                  style: TextStyle(
                                    fontSize: 16.sp,
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
                        size: 200,
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
    );
  }
}
