import 'package:demo/utils/navigation/app_routes.dart';
import 'package:demo/utils/constants/local_storage_key_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_storage/get_storage.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
      title: const Text("Sign In"),
    ),
    body:  Center(
      child: InkWell(
        onTap: () async {
          // await GetStorage().write(LocalStorageKeyStrings.isLogin, true);
          if (context.mounted) {
            context.go(DashboardRoutes.dashboard);
          }
        },
        child: const Text("Sign In Screen"),
      ),
    )
    );
  }
} 
