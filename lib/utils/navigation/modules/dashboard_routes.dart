// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';

// import '../app_routes.dart';
// import '../route_config.dart';

// /// Dashboard module routes
// class DashboardRouteModule extends RouteModule {
//   @override
//   String get moduleName => 'Dashboard';

//   @override
//   List<GoRoute> get routes => [
//     // Main dashboard
//     GoRoute(
//       path: DashboardRoutes.dashboard,
//       name: 'dashboard',
//       pageBuilder: (context, state) {
//         // final storedUserType =
//         //     GetStorage().read(LocalStorageKeyStrings.userType) ?? "";
//         // final isCandidate =
//         //     storedUserType.toString().toLowerCase() == "candidate";
//         // if (isCandidate) {
//         //   Get.put<BottomNavBarController>(
//         //     BottomNavBarController(),
//         //     permanent: true,
//         //   );
//         //   return RouteTransitions.fade(CandidateDashboard());
//         // }
//         // Get.put<BottomNavBarController>(
//         //   BottomNavBarController(),
//         //   permanent: true,
//         // );
//         Get.lazyPut<WeekCalendarController>(() => WeekCalendarController());
//         return RouteTransitions.fade(DashboardScreen());
//       },
//     ),
    
    
//   ];
// }
