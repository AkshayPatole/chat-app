class AppImages {
  AppImages._();

  // ==================== BASE PATHS ====================
  static const String _base = "assets/images";

  // Category paths
  // Branding assets live at top-level `assets/brandings`
  static const String _branding = "assets/brandings";
  static const String blackLogo = "$_base/black_app_logo.svg";

  // ==================== BRANDING ====================
  /// Main application logo
  static const String logo = "$_branding/app-logo.svg";
}


// ==================== AUTHENTICATION ====================
/// Authentication-related images
class AppImagesAuth {
  AppImagesAuth._();
  
  static const String _auth = "assets/images/auth";

  /// Success email verification image
  static const String successEmail = "$_auth/success_email.svg";

  /// Failed/wrong email image
  static const String failedEmail = "$_auth/wrong_email.svg";
  /// Account unlocked success image
  static const String accountUnlocked = "$_auth/account_unlocked.svg";

  /// OTP verification success image
  static const String otpSuccess = "$_auth/otp_success.svg";

  /// Password reset lock icon
  static const String lockIcon = "$_auth/reset_lock_icon.svg";

  /// Face scanning icon
  static const String faceScanningIcon = "$_auth/scaning_face_icon.svg";

  /// Reminder icon
  static const String reminder = "$_auth/reminder.svg";

  /// Pending Appoval icon
  static const String pendingApproval = "$_auth/pending_approval.svg";

  /// Date Picker icon
  static const String datePicker = "$_auth/date_picker.svg";
}

// ==================== NAVIGATION ====================
/// Navigation-related images
class AppImagesNavigation {
  AppImagesNavigation._();

  static const String _navigation = "assets/images/navigation";

  /// Bottom navigation bar icons (6 icons)
  static const List<String> bottomNavIcons = [
    "$_navigation/bottom_nav/home_icon.svg",
    "$_navigation/bottom_nav/job_icon.svg",
    "$_navigation/bottom_nav/profile_icon.svg",
    "$_navigation/bottom_nav/hierarchy_icon.svg",
    "$_navigation/bottom_nav/time_icon.svg",
    "$_navigation/bottom_nav/expense.svg",
  ];

  /// Job details navigation bar icons (8 icons)
  static const List<String> jobDetailsNavIcons = [
    "$_navigation/job_details_nav/job_details_icon1.svg",
    "$_navigation/job_details_nav/job_details_icon2.svg",
    "$_navigation/job_details_nav/job_details_icon3.svg",
    "$_navigation/job_details_nav/job_details_icon4.svg",
    "$_navigation/job_details_nav/job_details_icon5.svg",
    "$_navigation/job_details_nav/job_details_icon6.svg",
    "$_navigation/job_details_nav/job_details_icon7.svg",
    "$_navigation/job_details_nav/job_details_icon8.svg",
  ];
}




// ==================== ICONS - USER ====================
/// User-related icons
class AppImagesIconsUser {
  AppImagesIconsUser._();

  static const String _iconsUser = "assets/images/icons/user";

  static const String userCheck = "$_iconsUser/user_check_icon.svg";
  static const String userScan = "$_iconsUser/user_scan_icon.svg";
  static const String userSquare = "$_iconsUser/user_square_icon.svg";
  static const String userSwitch = "$_iconsUser/user_switch_icon.svg";
  static const String basicUser = "$_iconsUser/basic_user_icon.svg";
  static const String advanceUser = "$_iconsUser/advance_user_icon.svg";
  static const String profile = "$_iconsUser/profile_img.svg";
  static const String clockUser = "$_iconsUser/clockuser.svg";
  static const String approvedByIcon = "$_iconsUser/approved_by_icon.svg";
}


// ==================== ICONS - STATUS ====================
/// Status indicator icons
class AppImagesIconsStatus {
  AppImagesIconsStatus._();

  static const String _iconsStatus = "assets/images/icons/status";

  static const String checkCircle = "$_iconsStatus/check_circle.svg";
  static const String pending = "$_iconsStatus/pending_icon.svg";
  static const String actionRequired = "$_iconsStatus/action_required.svg";
  static const String notificationRed =
      "$_iconsStatus/notification_red_icon.svg";
  static const String dot = "$_iconsStatus/dot_icon.svg";
  static const String unionCancel = "$_iconsStatus/union_cancle_icon.svg";
}

// ==================== TOAST / SNACKBAR ====================
/// Toast and snackbar icons
class AppImagesToast {
  AppImagesToast._();

  static const String _toast = "assets/images/toast";

  static const String success = "$_toast/success_toast.svg";
  static const String successLead = "$_toast/success_toast_icon.svg";
  static const String error = "$_toast/error_toast_icon.svg";
  static const String warning = "$_toast/warning_toast_icon.svg";
  static const String message = "$_toast/snackbar_message_icon.svg";
  static const String greenBubbles = "$_toast/green_bubbles.svg";
}

class AppImagesProfile {
  AppImagesProfile._();
  static const String _profile = "assets/images/profile";
  static const String editProfileIcon = "$_profile/edit_profile_icon.svg";
  static const String usersIcon = "$_profile/users.svg";
  static const String keyIcon = "$_profile/key.svg";
  static const String signOutIcon = "$_profile/sign_out.svg";
  static const String contactIcon = "$_profile/contact.svg";
  static const String browserIcon = "$_profile/browser.svg";
  static const String associationIcon = "$_profile/association.svg";
  static const String emailIcon = "$_profile/email_icon.svg";
  static const String homeIcon = "$_profile/home_icon.svg";
  static const String substractIcon = "$_profile/substract_icon.svg";
}

class AppImagesDrawer {
  AppImagesDrawer._();
  static const String _drawer = "assets/images/drawer";
  static const String dashboardIcon = "$_drawer/dashboard_icon.svg";
  static const String programSwitchIcon = "$_drawer/program_switch_icon.svg";
  static const String jobIcon = "$_drawer/job_icon.svg";
  static const String candidateIcon = "$_drawer/candidate_icon.svg";
  static const String assignmentIcon = "$_drawer/assignment_icon.svg";
  static const String timeAndExpenseIcon = "$_drawer/time_and_expence_icon.svg";
  static const String invoicesIcon = "$_drawer/invoices_icon.svg";
  static const String rfxIcon = "$_drawer/rfx_icon.svg";
  static const String sowIcon = "$_drawer/sow_icon.svg";
  static const String vendorManagementIcon =
      "$_drawer/vendor_management_icon.svg";
  static const String analyticsIcon = "$_drawer/analytics_icon.svg";
  static const String selfConfigurationIcon =
      "$_drawer/self_configuration_icon.svg";
  static const String expenseIcon = "$_drawer/expense.svg";
  static const String filterIcon = "$_drawer/filter_icon.svg";

}

