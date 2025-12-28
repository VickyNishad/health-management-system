import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicque_app/core/widgets/gradiant_text.dart' show GradientText;

import '../../widgets/medique_service.dart';
import '../../widgets/three_step_card.dart';

class MobilePatientDashboard extends StatelessWidget {
  const MobilePatientDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GradientText(
            text: " 3 Steps to Connect, Consult, \n                and Care !",
            style: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold),
            gradient: const LinearGradient(
              colors: [Color(0x33745EDD), Color(0xCC745EDD)],
            ),
          ),
          SizedBox(
            height: 510.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Center items in Row
              children: [
                ThreeStepCard(
                  imgPath: 'assets/images/3step_1.png',
                  title: "Search & Select",
                  number: 1,
                  subtitle: "Find and choose your \nDoctor with ease.",
                  titleFontSize: 18,
                  subtitleFontSize: 13,
                  imageSize: 62.21,
                ),
                // const SizedBox(width: 100),
                ThreeStepCard(
                  imgPath: 'assets/images/3step_2.png',
                  title: "Generate Token",
                  number: 2,
                  subtitle: "Generate your Doctor \ntoken instantly.",
                  titleFontSize: 18,
                  subtitleFontSize: 13,
                  imageSize: 62.21,
                  subtitleWidth: 243,
                ),
                // const SizedBox(width: 40),
                ThreeStepCard(
                  imgPath: 'assets/images/3step_3.png',
                  title: "Track queue",
                  number: 3,
                  subtitle: "Sit back, relax, and track \nyour queue live.",
                  titleFontSize: 18,
                  subtitleFontSize: 13,
                  imageSize: 62.21,
                  subtitleWidth: 272,
                ),
              ],
            ),
          ),

          //
          SizedBox(
            height: 99,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/patient/dashboard/doctor_appointment');
                    // context.go('/');
                  },
                  child: Text(
                    "Your Health, Our Trusted \n           Consultation",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(width: 100, height: 2, color: Colors.black),
              ],
            ),
          ),
          SizedBox(height: 30.h), // Responsive Spacing// Responsive Spacing
          //
          MediqueService(
            title: "Book Consultation",
            assetImage: 'assets/images/consultation.png',
            height: 287,
            width: 260.87,
            imgHeight: 180,
            imgWidth: 180,
            footerColor: Color(0XFF745EDD),
            onTap: () {},
          ),

          SizedBox(height: 30.h), // Responsive Spacing

          MediqueService(
            title: "Book Lab Test",
            assetImage: 'assets/images/lab_test.png',
            height: 287,
            width: 260.87,
            imgHeight: 180,
            imgWidth: 180,
            footerColor: Color(0XFF745EDD),
            onTap: () {},
          ),

          SizedBox(height: 30.h), // Responsive Spacing

          MediqueService(
            title: "Book Hospital Bed",
            assetImage: 'assets/images/bed.png',
            height: 287,
            width: 260.87,
            imgHeight: 180,
            imgWidth: 180,
            footerColor: Color(0XFF745EDD),
            onTap: () {},
          ),

          SizedBox(height: 40.h),
          // MedicQueFooter(),
        ],
      ),
    );
  }
}
