import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicque_app/core/components/prifile_image.dart';

class DashboardTopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onNotificationTap;
  final String avatarUrl;
  final bool showNotification;

  const DashboardTopBar({
    super.key,
    required this.title,
    this.onNotificationTap,
    this.avatarUrl = 'https://i.pravatar.cc/150?img=11',
    this.showNotification = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 24.w : 16.w,
        vertical: 12.h,
      ),
      color: Colors.white,
      child: Row(
        children: [
          /// Page Title
          Text(
            title,
            style: TextStyle(
              fontSize: isDesktop ? 18.sp : 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          /// Notification Icon
          if (showNotification)
            InkWell(
              borderRadius: BorderRadius.circular(30.r),
              onTap: onNotificationTap,
              child: Padding(
                padding: EdgeInsets.all(6.r),
                child: Icon(
                  Icons.notifications_none,
                  size: isDesktop ? 24.sp : 22.sp,
                  color: Colors.grey,
                ),
              ),
            ),

          SizedBox(width: 12.w),

          /// Profile Avatar
          // CircleAvatar(
          //   radius: isDesktop ? 18.r : 15.r,
          //   backgroundImage: NetworkImage(avatarUrl),
          // ),
          ProfileImage(
            imagePath: "assets/images/doctor_img.png",
            isCircle: true,
            size: 30,
          ),
        ],
      ),
    );
  }
}
