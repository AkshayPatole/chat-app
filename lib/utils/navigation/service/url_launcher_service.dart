// import 'package:url_launcher/url_launcher.dart';
// import 'package:v4_mobile_application/utils/misc/logger_service.dart';
// import '../constants/app_strings.dart';

// class AppUrlLauncher {
//   // Static instance for convenience
//   static final AppUrlLauncher _instance = AppUrlLauncher._internal();
//   factory AppUrlLauncher() => _instance;
//   AppUrlLauncher._internal();

//   /// Launches a given [url] with customizable [mode] and other parameters.
//   /// Default mode is [LaunchMode.externalApplication].
//   static Future<void> launchURL(
//     String url, {
//     LaunchMode mode = LaunchMode.externalApplication,
//     WebViewConfiguration webViewConfiguration = const WebViewConfiguration(),
//     String? webOnlyWindowName,
//   }) async {
//     try {
//       final Uri uri = Uri.parse(url);
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(
//           uri,
//           mode: mode,
//           webViewConfiguration: webViewConfiguration,
//           webOnlyWindowName: webOnlyWindowName,
//         );
//       } else {
//         LoggerService.log('Could not launch $url');
//       }
//     } catch (e) {
//       LoggerService.log('Error launching URL: $e');
//     }
//   }

//   /// Specific method for privacy policy.
//   static Future<void> launchPrivacyPolicy() async {
//     await launchURL(AppStrings.privacyPolicyUrl ,);
//   }
// }
