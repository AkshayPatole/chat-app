import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import '../../features/global/splash/view/splash_screen.dart';
import '../constants/local_storage_key_strings.dart';
import '../misc/logger_service.dart';
import 'app_routes.dart';
import 'modules/auth_routes.dart';
import 'modules/profile_routes.dart';
import 'route_config.dart';
import 'service/app_state_service.dart';

/// Main application router
/// This class orchestrates all route modules and provides centralized routing configuration
class AppRouter {
  late AppStateService appStateService;

  AppRouter(this.appStateService);

  /// All route modules registered in the application
  /// Add new modules here as your app grows
  late final List<RouteModule> _modules = [
    AuthRouteModule(),
    // DashboardRouteModule(),
    // JobRouteModule(),
   
    ProfileRouteModule(),
  ];

  /// Get all routes from all modules
  List<GoRoute> get _allRoutes {
    final routes = <GoRoute>[];

    // Add root route
    routes.add(_rootRoute);

    // Add all module routes
    for (final module in _modules) {
      routes.addAll(module.routes);
    }

    return routes;
  }

  /// Root route handler
  GoRoute get _rootRoute => GoRoute(
    path: AppRoutes.root,
    builder: (context, state) {
      return SplashScreen();
      // bool isLogin = GetStorage().read(LocalStorageKeyStrings.isLogin) ?? false;
      // if (isLogin) {
      //   final storedUserType =
      //       GetStorage().read(LocalStorageKeyStrings.userType) ?? "";
      //   final isCandidate =
      //       storedUserType.toString().toLowerCase() == "candidate";
      //   if (isCandidate) {
      //     Get.lazyPut<WeekCalendarController>(() => WeekCalendarController());
      //     return CandidateDashboard();
      //   }
      //   return DashboardScreen();
      // } else {
      //   return const SplashScreen();
      // }
    },
  );

  /// Main GoRouter instance
  late final GoRouter router = GoRouter(
    navigatorKey: LocalStorageKeyStrings.appNavKey,
    initialLocation: AuthRoutes.splash,
    debugLogDiagnostics: true,
    routerNeglect: true,
    refreshListenable: appStateService,
    redirect: _handleRedirect,
    routes: _allRoutes,
    errorBuilder: _errorBuilder,
  );

  /// Global redirect handler for authentication and authorization
  String? _handleRedirect(BuildContext context, GoRouterState state) {
    final currentPath = state.uri.path;
    final isLoggedIn = appStateService.isLoggedIn;

    // Check if route requires authentication
    final requiresAuth = AppRoutes.requiresAuth(currentPath);

    // Redirect to splash if not logged in and trying to access protected route
    if (!isLoggedIn && currentPath != AuthRoutes.splash && requiresAuth) {
      return AuthRoutes.splash;
    }

    // Redirect to dashboard if logged in and on splash
    if (isLoggedIn && currentPath == AuthRoutes.splash) {
      return DashboardRoutes.dashboard;
    }

    return null;
  }

  /// Error page builder
  Widget _errorBuilder(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              state.uri.path,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(DashboardRoutes.dashboard),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }

  /// Get route information for debugging
  Map<String, dynamic> getRouteInfo() {
    return {
      'total_modules': _modules.length,
      'modules': _modules.map((m) => m.moduleName).toList(),
      'total_routes': _allRoutes.length,
      'auth_free_routes': AppRoutes.authFreeRoutes.length,
    };
  }

  /// Print route tree for debugging
  void printRouteTree() {
    LoggerService.log('=== Route Tree ===');
    LoggerService.log('Total Modules: ${_modules.length}');
    for (final module in _modules) {
      LoggerService.log('\n${module.moduleName}:');
      for (final route in module.routes) {
        LoggerService.log('  - ${route.path}');
      }
    }
    LoggerService.log('\nTotal Routes: ${_allRoutes.length}');
    LoggerService.log('==================');
  }
}

/// Legacy transition helper for backward compatibility
@Deprecated('Use RouteTransitions.fade() instead')
CustomTransitionPage<dynamic> hcCustomTransitionPage(Widget widget) {
  return RouteTransitions.fade(widget);
}
