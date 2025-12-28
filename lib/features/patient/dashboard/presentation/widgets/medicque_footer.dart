import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicQueFooter extends StatelessWidget {
  const MedicQueFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF745EDD),
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 60.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo + Tagline
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                    child: const Image(
                      image: AssetImage('assets/images/footer_logo.png'),
                    ),
                  ),
                  // SizedBox(height: 10.h),
                  // Text(
                  //   "Smart Queue Better Care",
                  //   style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  // ),
                ],
              ),

              // Links section left
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FooterLink("About Us"),
                  FooterLink("Contact Us"),
                  FooterLink("Blog"),
                  FooterLink("Careers"),
                ],
              ),

              // Links section right
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FooterLink("Book Appointment"),
                  FooterLink("My Appointments"),
                  FooterLink("Search for Doctors"),
                ],
              ),

              // Social Media + Policies
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Follow Us On",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      Icon(Icons.facebook, color: Colors.white, size: 20.sp),
                      SizedBox(width: 12.w),
                      Icon(Icons.camera_alt, color: Colors.white, size: 20.sp),
                      SizedBox(width: 12.w),
                      Icon(Icons.email, color: Colors.white, size: 20.sp),
                      SizedBox(width: 12.w),
                      Icon(Icons.business, color: Colors.white, size: 20.sp),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  const FooterLink("Privacy Policy"),
                  const FooterLink("Terms and Conditions"),
                ],
              ),
            ],
          ),

          SizedBox(height: 40.h),
          Container(height: 1.h, color: Colors.white54),

          SizedBox(height: 20.h),
          Center(
            child: Text(
              "Copyright © 2025, MedicQue Pvt. Ltd. | Designed by ThinkStratum Pvt Ltd",
              style: TextStyle(color: Colors.white70, fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String title;
  const FooterLink(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
    );
  }
}
