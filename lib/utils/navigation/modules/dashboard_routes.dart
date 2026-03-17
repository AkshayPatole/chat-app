import 'package:go_router/go_router.dart';

import '../../../features/global/dashboard/view/dashboard_view.dart';
import '../app_routes.dart';
import '../route_config.dart';

/// Dashboard module routes
class DashboardRouteModule extends RouteModule {
  @override
  String get moduleName => 'Dashboard';

  @override
  List<GoRoute> get routes => [
    // Main dashboard
    GoRoute(
      path: DashboardRoutes.dashboard,
      name: 'dashboard',
      builder: (context, state) => const DashboardView(),
    ),
  ];
}
