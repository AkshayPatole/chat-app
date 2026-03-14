import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Base class for route module configuration
/// Each feature module should extend this to define its routes
abstract class RouteModule {
  /// Returns the list of GoRoute configurations for this module
  List<GoRoute> get routes;
  
  /// Module name for debugging and logging
  String get moduleName;
}

/// Configuration for a single route with metadata
class RouteDefinition {
  final String path;
  final String name;
  final Widget Function(BuildContext, GoRouterState) builder;
  final Page Function(BuildContext, GoRouterState)? pageBuilder;
  final List<RouteDefinition> subRoutes;
  final bool requiresAuth;
  final Map<String, dynamic>? metadata;
  
  const RouteDefinition({
    required this.path,
    required this.name,
    required this.builder,
    this.pageBuilder,
    this.subRoutes = const [],
    this.requiresAuth = true,
    this.metadata,
  });
  
  /// Convert to GoRoute
  GoRoute toGoRoute() {
    return GoRoute(
      path: path,
      name: name,
      builder: pageBuilder == null ? builder : null,
      pageBuilder: pageBuilder,
      routes: subRoutes.map((r) => r.toGoRoute()).toList(),
    );
  }
}

/// Route transition configurations
class RouteTransitions {
  RouteTransitions._();
  
  /// Fade transition
  static CustomTransitionPage<T> fade<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, childWidget) {
        return FadeTransition(opacity: animation, child: childWidget);
      },
    );
  }
  
  /// Slide from right transition
  static CustomTransitionPage<T> slideFromRight<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, childWidget) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: childWidget);
      },
    );
  }
  
  /// Slide from bottom transition
  static CustomTransitionPage<T> slideFromBottom<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, childWidget) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: childWidget);
      },
    );
  }
  
  /// Scale transition
  static CustomTransitionPage<T> scale<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, childWidget) {
        return ScaleTransition(scale: animation, child: childWidget);
      },
    );
  }
  
  /// No transition (instant)
  static CustomTransitionPage<T> none<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, childWidget) {
        return childWidget;
      },
    );
  }
}
