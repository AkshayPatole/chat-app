import 'package:go_router/go_router.dart';

import '../route_config.dart';

class ProfileRouteModule extends RouteModule {
  @override
  String get moduleName => 'Profile';

  @override
  List<GoRoute> get routes => [
    // GoRoute(
    //   path: ProfileRoutes.profile,
    //   name: 'profile',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<ProfileController>(() => ProfileController());
    //     Get.lazyPut<AddDelegationController>(() => AddDelegationController());
    //     return RouteTransitions.fade(const ProfileScreen());
    //   },
    // ),
    // GoRoute(
    //   path: ProfileRoutes.editProfileScreen,
    //   name: 'edit-profile',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<EditProfileController>(() => EditProfileController());
    //     return RouteTransitions.fade(const EditProfileScreen());
    //   },
    // ),
    // GoRoute(
    //   path: ProfileRoutes.securityCodeVerification,
    //   name: 'verification-profile',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<ProfileController>(() => ProfileController());
    //     return RouteTransitions.fade(const SecurityCodeVerificationScreen());
    //   },
    // ),
    // GoRoute(
    //   path: ProfileRoutes.changePasswordScreen,
    //   name: 'change-password',
    //   pageBuilder: (context, state) {
    //     Get.lazyPut<ProfileController>(() => ProfileController());
    //     return RouteTransitions.fade(const ChangePasswordProfileScreen());
    //   },),
  ];
}
