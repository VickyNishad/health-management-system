import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'router/app_router.dart';

class ScreenUtilWrapper extends StatelessWidget {
  const ScreenUtilWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Size designSize;

    if (width < 600) {
      designSize = const Size(360, 690); // mobile
    } else if (width < 1200) {
      designSize = const Size(768, 1024); // tablet
    } else {
      designSize = const Size(1440, 1024); // web
    }

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => const AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
