/// Base class for all route configurations
/// This provides type-safe route management with parameters
abstract class RouteConfig {
  const RouteConfig();

  /// The route path
  String get path;

  /// The route name (used for navigation)
  String get name;
}

/// Authentication related routes
class AuthRoutes {
  AuthRoutes._();

  static const String splash = '/splash';
  static const String signin = '/signin';
  static const String forgotPassword = '/forgot-password';
  static const String forgotUsername = '/forgot-username';
  static const String verificationOtp = '/verification-otp';
  static const String updatePassword = '/update-password';
  static const String programSelection = '/program-selection';
  static const String privacyPolicy = '/privacy-policy';
}

class ProfileRoutes {
  ProfileRoutes._();
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String securityCodeVerification = '/security-code-verification';
  static const String editProfileScreen = '/edit-profile';
  static const String changePasswordScreen = '/change-password';
}

/// Dashboard and home routes
class DashboardRoutes {
  DashboardRoutes._();

  static const String dashboard = '/dashboard';
  static const String eventDetails = '/dashboard/event-details';
  static const String activityDetails = '/dashboard/activity-details';
}

/// Candidate management routes
class CandidateRoutes {
  CandidateRoutes._();

  static const String list = '/candidates';
  static const String details = '/candidates/details';
  static const String create = '/candidates/create';
  static const String edit = '/candidates/edit';
  static const String gettingStarted = '/candidates/getting-started';
  static const String basicDetails = '/candidates/basic-details';
  static const String credentialDetails = '/candidates/credential-details';
}

/// Invoice routes
class InvoiceRoutes {
  InvoiceRoutes._();

  static const String list = '/invoices';
  static const String details = '/invoices/details';
  static const String consolidated = '/invoices/consolidated';
  static const String consolidatedDetails = '/invoices/consolidated/details';
}

/// Expense routes
class ExpenseRoutes {
  ExpenseRoutes._();

  static const String list = '/expenses';
  static const String create = '/expenses/create';

  static const String details = '/expenses/detail';
  static const String workflow = '/expenses/workflow';
  static const String history = '/expenses/history';
  static const String historyDetails = '/expenses/history/details';
  static const String billing = '/expenses/billing';
  static const String addExpense = '/expenses/add-expense';
}

/// Statement of Work (SOW) routes
class SowRoutes {
  SowRoutes._();

  static const String list = '/sow';
  static const String details = '/sow/details';
  static const String create = '/sow/create';
  static const String edit = '/sow/edit';
}

/// Main AppRoutes class that aggregates all routes
/// This is the single source of truth for all application routes
class AppRoutes {
  AppRoutes._();

  // Root route
  static const String root = '/';

  // Auth routes
  static final auth = AuthRoutes;

  // Feature routes
  static final dashboard = DashboardRoutes;
  // static final jobs = JobRoutes;

  /// Get all auth-free routes (routes that don't require authentication)
  static Set<String> get authFreeRoutes => {
    AppRoutes.root,
    AuthRoutes.splash,
    AuthRoutes.signin,
    AuthRoutes.forgotPassword,
    AuthRoutes.forgotUsername,
    AuthRoutes.verificationOtp,
    AuthRoutes.updatePassword,
    AuthRoutes.programSelection,
    AuthRoutes.privacyPolicy,
  };

  /// Check if a route requires authentication
  static bool requiresAuth(String path) {
    return !authFreeRoutes.contains(path);
  }

  /// @deprecated Use AppRoutes.root instead
  static const String defaultLocation = root;

  /// @deprecated Use AppRoutes.auth.splash instead
  static const String splash = AuthRoutes.splash;

  /// @deprecated Use AppRoutes.auth.signin instead
  static const String signinScreen = AuthRoutes.signin;

  /// @deprecated Use AppRoutes.auth.forgotPassword instead
  static const String forgetScreen = AuthRoutes.forgotPassword;

  /// @deprecated Use AppRoutes.auth.forgotUsername instead
  static const String forgetUsernameScreen = AuthRoutes.forgotUsername;

  /// @deprecated Use AppRoutes.auth.verificationOtp instead
  static const String verificationOtpScreen = AuthRoutes.verificationOtp;

  /// @deprecated Use AppRoutes.auth.updatePassword instead
  static const String updatePasswordScreen = AuthRoutes.updatePassword;

  /// @deprecated Use AppRoutes.auth.programSelection instead
  static const String programSelectionScreen = AuthRoutes.programSelection;

  /// @deprecated Use AppRoutes.dashboard.dashboard instead
  static const String dashboardScreen = DashboardRoutes.dashboard;

  /// @deprecated Use AppRoutes.dashboard.eventDetails instead
  static const String dashboardEventDetailScreen = DashboardRoutes.eventDetails;

  /// @deprecated Use AppRoutes.candidates.list instead
  static const String candidateScreen = CandidateRoutes.list;

  /// @deprecated Use AppRoutes.candidates.create instead
  static const String createCandidateScreen = CandidateRoutes.create;

  /// @deprecated Use AppRoutes.candidates.details instead
  static const String candidateDetailsScreen = CandidateRoutes.details;

  /// @deprecated Use AppRoutes.invoices.list instead
  static const String invoiceListScreen = InvoiceRoutes.list;

  /// @deprecated Use AppRoutes.invoices.details instead
  static const String invoiceDetailsScreen = InvoiceRoutes.details;

  /// @deprecated Use AppRoutes.invoices.consolidated instead
  static const String consolidatedInvoiceListScreen =
      InvoiceRoutes.consolidated;

  /// @deprecated Use AppRoutes.invoices.consolidatedDetails instead
  static const String consolidatedInvoiceDetailsScreen =
      InvoiceRoutes.consolidatedDetails;

  /// @deprecated Use AppRoutes.expenses.list instead
  static const String expenceListingScreen = ExpenseRoutes.list;

  /// @deprecated Use AppRoutes.sow.list instead
  static const String sowListingScreen = SowRoutes.list;

  /// @deprecated Use AppRoutes.sow.details instead
  static const String sowDetailsScreen = SowRoutes.details;

  /// @deprecated Use AppRoutes.sow.details instead
  static const String expanseDetailsScreen = ExpenseRoutes.details;

  /// @deprecated Use AppRoutes.expenses.workflow instead
  static const String expanseWorkflowScreen = ExpenseRoutes.workflow;

  /// @deprecated Use AppRoutes.expenses.history instead
  static const String expenseHistoryScreen = ExpenseRoutes.history;

  /// @deprecated Use AppRoutes.expenses.historyDetails instead
  static const String expenseHistoryDetailsScreen =
      ExpenseRoutes.historyDetails;

  /// @deprecated Use AppRoutes.sow.details instead
  static const String expanseBillingDetailsScreen = ExpenseRoutes.billing;

  static const String addExpenseScreen = ExpenseRoutes.addExpense;

}
