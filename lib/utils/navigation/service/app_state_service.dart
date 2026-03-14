import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/local_storage_key_strings.dart';

class AppStateService extends GetxController  {
  bool isLoggedIn = false;
  String? userId;
  String? programId;
  String? programDisplayName;
  String? tenantId;
  String? tenantType;
  int currentThemeIndex = 0;
  
  // Hierarchy configuration
  String? dateFormat;
  String? timeFormat;
  String? timezone;
  String? currency;
  String? language;
  bool isAccuracyEnabled = false;

  @override
  void onInit() {
    fetchFromLocalStorage();
    Future.wait([
    ]);
    super.onInit();
  }

  fetchFromLocalStorage() {
    isLoggedIn = GetStorage().read(LocalStorageKeyStrings.isLogin) ?? false;
    userId = GetStorage().read(LocalStorageKeyStrings.loggedInUserId);
    programId =GetStorage().read(LocalStorageKeyStrings.programId);
    tenantId = GetStorage().read(LocalStorageKeyStrings.tenantId);
    tenantType = GetStorage().read(LocalStorageKeyStrings.tenantType);
    currentThemeIndex = GetStorage().read(LocalStorageKeyStrings.themeIndex) ?? 0;
    _loadLocale();
    // getIt<PermissionService>().loadPermissions();
    isAccuracyEnabled = GetStorage().read(LocalStorageKeyStrings.accuracyConfiguration) ?? false;
    update();
  }

  Future<void> clearLogin() async {
    isLoggedIn = false;
    userId = null;
    programId = null;
    programDisplayName = null;
    tenantId = null;
    tenantType = null;
    dateFormat = null;
    timeFormat = null;
    timezone = null;
    currency = null;
    language = null;
    // getIt<PermissionService>().clearPermissions();
    // await GetStorage().erase();
    // LocalStorageKeyStrings.appNavKey.currentContext?.go(AppRoutes.root);
    update();
  }

  static AppStateService to() {
    if (!Get.isRegistered<AppStateService>()) {
      Get.put(AppStateService());
    }
    return Get.find<AppStateService>();
  }

  /// Get the current program ID
  String getProgramId() {
    return programId ?? '';
  }

  /// Get the current program Display Name
  String getProgramDisplayName() {
    return programDisplayName ?? '';
  }

  /// Get the current user ID
  String getUserId() {
    return userId ?? '';
  }

  /// Get the current tenant ID
  String getTenantId() {
    return tenantId ?? '';
  }

  /// Get the current tenant Type
  String getTenantType() {
    return tenantType ?? '';
  }

  // Locale Management
  Locale? _locale;
  Locale? get locale => _locale;

  void changeLocale(String languageCode) {
    final newLocale = Locale(languageCode);
    _locale = newLocale;
    Get.updateLocale(newLocale);
    GetStorage().write(LocalStorageKeyStrings.locale, languageCode);
    update();
  }
/// update time call only this 
/// AppStateService.to().changeLocale('es');

  void changeTheme(int index) {
    currentThemeIndex = index;
    GetStorage().write(LocalStorageKeyStrings.themeIndex, index);
    update();
  }

  void updateHierarchyConfig({
  String? dateFormat,
  String? timeFormat,
  String? timezone,
  String? currency,
  String? language,
  String? defaultTimezone,
}) {
  final storage = GetStorage();

  if (dateFormat != null) {
    this.dateFormat = dateFormat;
    storage.write(LocalStorageKeyStrings.defaultDateFormat, dateFormat);
  }

  if (timeFormat != null) {
    this.timeFormat = timeFormat;
    storage.write(LocalStorageKeyStrings.defaultTimeFormat, timeFormat);
  }

  /// Priority: defaultTimezone > timezone
  final selectedTimezone = defaultTimezone ?? timezone;

  if (selectedTimezone != null) {
    this.timezone = selectedTimezone;
    storage.write(LocalStorageKeyStrings.timezone, selectedTimezone);
  }

  if (currency != null) this.currency = currency;
  if (language != null) this.language = language;

  update();
}

  void _loadLocale() {
    final savedLocale = GetStorage().read(LocalStorageKeyStrings.locale);
    if (savedLocale != null) {
      _locale = Locale(savedLocale);
      Get.updateLocale(_locale!);
    } else {
      _locale = const Locale('en'); 
    }
  }
}

