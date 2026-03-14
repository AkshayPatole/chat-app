// import 'package:get_storage/get_storage.dart';
// import '../../utils/constants/local_storage_key_strings.dart';

// import 'package:injectable/injectable.dart';

// @lazySingleton
// class PermissionService {
//   List<Permission> _permissions = [];

//   final _storage = GetStorage();

//   Future<void> init() async {
//     loadPermissions();
//   }

//   void setPermissions(List<Permission> permissions) {
//     _permissions = permissions;
//     _savePermissions();
//   }

//   void _savePermissions() {
//     final List<Map<String, dynamic>> jsonList = 
//         _permissions.map((p) => p.toJson()).toList();
//     _storage.write(LocalStorageKeyStrings.userPermissions, jsonList);
//   }

//   /// Load permissions from local storage
//   void loadPermissions() {
//     final storedData = _storage.read(LocalStorageKeyStrings.userPermissions);
//     if (storedData != null && storedData is List) {
//       _permissions = storedData
//           .map((e) => Permission.fromJson(Map<String, dynamic>.from(e)))
//           .toList();
//     }
//   }

//   /// Check if user has a specific permission by slug
//   /// 
//   /// Returns true if the user has the permission, false otherwise
 
//   /// ```
//   bool hasPermission(String slug) {
//     if (slug.isEmpty) return false;
//     return _permissions.any((permission) => permission.slug == slug);
//   }

//   /// Check if user has any of the given permissions
//   /// 
//   /// Returns true if the user has at least one of the permissions
//   /// 
//   bool hasAnyPermission(List<String> slugs) {
//     if (slugs.isEmpty) return false;
//     return slugs.any((slug) => hasPermission(slug));
//   }

//   /// Check if user has all of the given permissions
//   /// 
//   /// Returns true only if the user has all the permissions
//   /// 
//   bool hasAllPermissions(List<String> slugs) {
//     if (slugs.isEmpty) return false;
//     return slugs.every((slug) => hasPermission(slug));
//   }

//   /// Get all permissions
//   /// 
//   /// Returns a copy of the permissions list to prevent external modification
//   List<Permission> getPermissions() {
//     return List.unmodifiable(_permissions);
//   }

//   /// Get all permission slugs
//   /// 
//   /// Returns a list of all permission slugs the user has
//   List<String> getPermissionSlugs() {
//     return _permissions
//         .where((p) => p.slug != null)
//         .map((p) => p.slug!)
//         .toList();
//   }

//   /// Get all permission labels
//   /// 
//   /// Returns a list of all permission labels the user has
//   List<String> getPermissionLabels() {
//     return _permissions
//         .where((p) => p.label != null)
//         .map((p) => p.label!)
//         .toList();
//   }

//   /// Clear all permissions
//   /// 
//   /// This should be called when the user logs out
//   void clearPermissions() {
//     _permissions = [];
//     _storage.remove(LocalStorageKeyStrings.userPermissions);
//   }

//   /// Check if any permissions are loaded
//   /// 
//   /// Returns true if permissions have been set, false otherwise
//   bool hasPermissionsLoaded() {
//     return _permissions.isNotEmpty;
//   }
//   /// Get the count of permissions
//   int getPermissionCount() {
//     return _permissions.length;
//   }
// }
