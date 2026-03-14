import 'package:get/get.dart';
import '../../../../utils/constants/local_storage_key_strings.dart';

class SplashController extends GetxController {
  Future<void> navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 1));
    // final storage = GetStorage();
    // final accessToken = storage.read(LocalStorageKeyStrings.accessToken);
    final context = LocalStorageKeyStrings.appNavKey.currentContext;
    if (context == null) return;
    // final route = (accessToken != null && accessToken.toString().isNotEmpty)
    //     ? AppRoutes.programSelectionScreen
    //     : AppRoutes.signinScreen;
    // context.go(route);
  }
}
