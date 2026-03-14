// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import './env_config.dart';
// import '../utils/constants/app_colors.dart';
// import '../utils/dependency_locator.dart';
// import '../utils/service/app_state_service.dart';
// import '../utils/navigation/route_manager.dart';
// import '../utils/themes/v4_app_theme.dart';
// import '../utils/service/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

// class AppInitializer {
//   static Future<void> init(Environment env) async {
//     WidgetsFlutterBinding.ensureInitialized();
    
//     // Initialize Environment Configuration
//     await envConfig.init(env);
    
//     // Initialize Storage
//     await GetStorage.init();
    
//     // Native Bridge / UI Setup
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: AppColors.hintTextColor,
//     ));

//     // Global Services
//     initDependencyLocator();
//     Get.put(AppStateService(), permanent: true);
    
//     // Ensure all GetIt dependencies are ready
//     await getIt.allReady();

//     runApp(const MainApp());
//   }
// }

// class MainApp extends StatefulWidget {
//   const MainApp({super.key});

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   late AppRouter appRouter;

//   @override
//   void initState() {
//     final appStateService = Get.find<AppStateService>();
//     appRouter = AppRouter(appStateService);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: AppColors.transparent,
//         statusBarIconBrightness: Brightness.light,
//         statusBarBrightness: Brightness.dark,
//         systemNavigationBarColor: AppColors.transparent,
//         systemNavigationBarIconBrightness: Brightness.light,
//       ),
//       child: GetBuilder<AppStateService>(
//         builder: (controller) {
//           return MaterialApp.router(
//             title: envConfig.appName,
//             locale: controller.locale,
//             supportedLocales: AppLocalizations.supportedLocales,
//             localizationsDelegates: const [
//               AppLocalizations.delegate,
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             debugShowCheckedModeBanner: false,
//             theme: V4AppTheme.getLightTheme(controller.currentTheme),
//             darkTheme: V4AppTheme.getDarkTheme(controller.currentTheme),
//             themeMode: ThemeMode.light, 
//             routerDelegate: appRouter.router.routerDelegate,
//             routeInformationParser: appRouter.router.routeInformationParser,
//             routeInformationProvider: appRouter.router.routeInformationProvider,
//           );
//         },
//       ),
//     );
//   }
// }
