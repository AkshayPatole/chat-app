import 'package:demo/utils/navigation/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class _MyAppState extends State<MyApp> {
  late final AppRouter appRouter;

  @override
  void initState() {
    super.initState();
    appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: appRouter.router.routeInformationParser,
      routeInformationProvider: appRouter.router.routeInformationProvider,
      routerDelegate: appRouter.router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
