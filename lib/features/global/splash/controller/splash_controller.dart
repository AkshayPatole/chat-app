import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/local_storage_key_strings.dart';
import '../../../../utils/navigation/app_routes.dart';

class SplashController extends GetxController {
  Future<void> navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 2));
    final context = LocalStorageKeyStrings.appNavKey.currentContext;
    if (context == null) return;
    context.go(AppRoutes.signinScreen);
  }
}
