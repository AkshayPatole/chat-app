import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../features/global/splash/view/splash_screen.dart';
import '../app_routes.dart';
import '../route_config.dart';

/// Authentication module routes
class AuthRouteModule extends RouteModule {
  @override
  String get moduleName => 'Authentication';

  @override
  List<GoRoute> get routes => [
    // Splash screen
    GoRoute(
      path: AuthRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // Sign in
    GoRoute(
      path: AuthRoutes.signin,
      name: 'signin',
      // pageBuilder: (context, state) {
      //   Get.lazyPut<SigninController>(() => SigninController());
      //   return RouteTransitions.fade(const SignInScreen());
      // },
    ),

    // Forgot password
    // GoRoute(
    //   path: AuthRoutes.forgotPassword,
    //   name: 'forgot-password',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<SigninController>(() => SigninController());
    //     return RouteTransitions.fade(const ForgetPasswordScreen());
    //   },
    // ),

    // Forgot username
    // GoRoute(
    //   path: AuthRoutes.forgotUsername,
    //   name: 'forgot-username',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<SigninController>(() => SigninController());
    //     return RouteTransitions.fade(const ForgetUsernameScreen());
    //   },
    // ),

    // OTP verification
    // GoRoute(
    //   path: AuthRoutes.verificationOtp,
    //   name: 'verification-otp',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<SigninController>(() => SigninController());
    //     return RouteTransitions.fade(const VerificationOtpScreen());
    //   },
    // ),

    // Update password
    // GoRoute(
    //   path: AuthRoutes.updatePassword,
    //   name: 'update-password',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<SigninController>(() => SigninController());
    //     return RouteTransitions.fade(const UpdatePasswordScreen());
    //   },
    // ),

    // privacy policy
    // GoRoute(
    //   path: AuthRoutes.privacyPolicy,
    //   name: 'Privacy Policy',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<PrivacyPolicyController>(
    //       () => PrivacyPolicyController(),
    //     );
    //     return RouteTransitions.fade(const PrivacyPolicyScreen());
    //   },
    // ),
  ];
}
