import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size.width < 600
          ? const Size(360, 690) // mobile
          : MediaQuery.of(context).size.width < 1200
          ? const Size(768, 1024) // tablet
          : const Size(1440, 1024), // web
      minTextAdapt: true,
      splitScreenMode: true, // ✅ REQUIRED FOR WEB
      useInheritedMediaQuery: true, // ✅ REQUIRED FOR WEB
      builder: (_, __) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          title: "Health App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
        );
      },
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'router/app_router.dart';
// // import 'core/bloc/menu/menu_bloc.dart';

// // class App extends StatelessWidget {
// //   const App({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ScreenUtilInit(
// //       designSize: MediaQuery.of(context).size.width < 600
// //           ? const Size(360, 690) // mobile
// //           : MediaQuery.of(context).size.width < 1200
// //           ? const Size(768, 1024) // tablet
// //           : const Size(1440, 1024), // web
// //       minTextAdapt: true,
// //       splitScreenMode: true,
// //       builder: (_, __) {
// //         // 👇 Get MenuBloc from parent MultiBlocProvider
// //         final menuBloc = context.read<MenuBloc>();

// //         return MaterialApp.router(
// //           routerConfig: AppRouter.router,
// //           title: "Health App",
// //           debugShowCheckedModeBanner: false,
// //           theme: ThemeData.light(),
// //           darkTheme: ThemeData.dark(),

// //           // 🔥 IMPORTANT: Re-inject MenuBloc into Router subtree
// //           builder: (context, child) {
// //             return BlocProvider.value(value: menuBloc, child: child!);
// //           },
// //         );
// //       },
// //     );
// //   }
// // }

// // App.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'router/app_router.dart';
// import 'core/bloc/menu/menu_bloc.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       useInheritedMediaQuery: true, // <--- important
//       designSize: MediaQuery.of(context).size.width < 600
//           ? const Size(360, 690)
//           : MediaQuery.of(context).size.width < 1200
//           ? const Size(768, 1024)
//           : const Size(1440, 1024),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, __) {
//         return Builder(
//           // ensures correct context
//           builder: (context) {
//             final menuBloc = context.read<MenuBloc>(); // should exist from main
//             return MaterialApp.router(
//               routerConfig: AppRouter.router,
//               builder: (context, child) {
//                 // re-inject MenuBloc into router subtree
//                 return BlocProvider.value(value: menuBloc, child: child!);
//               },
//               debugShowCheckedModeBanner: false,
//             );
//           },
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'screenutil_wrapper.dart'; // ⬅️ add this import

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Health App",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),

//       // IMPORTANT: Don't use router here, use AppRoot inside wrapper
//       home: const ScreenUtilWrapper(),
//     );
//   }
// }
