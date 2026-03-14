// import '../../utils/dependency_locator.dart';
// import 'permission_service.dart';

// /// Helper class for easy access to permission checks throughout the app
// /// 
// /// This class provides static methods that internally use the PermissionService
// /// from GetIt, making it easier to check permissions without manually getting
// /// the service instance.
// /// 
// /// Usage:
// /// ```dart
// /// // Check single permission
// /// if (PermissionHelper.hasPermission('create_job')) {
// ///   // Show create job button
// /// }
// /// 
// /// // Check multiple permissions (any)
// /// if (PermissionHelper.hasAnyPermission(['edit_job', 'delete_job'])) {
// ///   // Show edit/delete options
// /// }
// /// 
// /// // Check multiple permissions (all)
// /// if (PermissionHelper.hasAllPermissions(['view_reports', 'export_data'])) {
// ///   // Show export button
// /// }
// /// ```
// class PermissionHelper {
//   // Private constructor to prevent instantiation
//   PermissionHelper._();

//   /// Get the PermissionService instance from GetIt
//   static PermissionService get _service => getIt<PermissionService>();

//   /// Check if user has a specific permission by slug
//   /// 
//   /// Returns true if the user has the permission, false otherwise
//   static bool hasPermission(String slug) {
//     return _service.hasPermission(slug);
//   }

//   /// Check if user has any of the given permissions
//   /// 
//   /// Returns true if the user has at least one of the permissions
//   static bool hasAnyPermission(List<String> slugs) {
//     return _service.hasAnyPermission(slugs);
//   }

//   /// Check if user has all of the given permissions
//   /// 
//   /// Returns true only if the user has all the permissions
//   static bool hasAllPermissions(List<String> slugs) {
//     return _service.hasAllPermissions(slugs);
//   }

//   /// Get all permissions
//   /// 
//   /// Returns a list of all Permission objects
//   static List<Permission> getPermissions() {
//     return _service.getPermissions();
//   }

//   /// Get all permission slugs
//   /// 
//   /// Returns a list of all permission slugs the user has
//   static List<String> getPermissionSlugs() {
//     return _service.getPermissionSlugs();
//   }

//   /// Get all permission labels
//   /// 
//   /// Returns a list of all permission labels the user has
//   static List<String> getPermissionLabels() {
//     return _service.getPermissionLabels();
//   }

//   /// Check if any permissions are loaded
//   /// 
//   /// Returns true if permissions have been set, false otherwise
//   static bool hasPermissionsLoaded() {
//     return _service.hasPermissionsLoaded();
//   }

//   /// Get the count of permissions
//   static int getPermissionCount() {
//     return _service.getPermissionCount();
//   }
// }
