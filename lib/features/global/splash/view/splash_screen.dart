import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../controller/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SplashController>(() => SplashController());
    final splashController = Get.find<SplashController>();
    splashController.navigateToOnboarding();
    return Scaffold(
      backgroundColor: AppColors.cyanBlueColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: SvgPicture.asset(AppImages.logo),
          ),
        ],
      ),
    );
  }
}
