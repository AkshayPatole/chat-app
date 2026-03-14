// import 'package:flutter_dotenv/flutter_dotenv.dart';

// enum Environment { dev, qa, prod, uat, demo, preprod }

// class EnvConfig {
//   static final EnvConfig _instance = EnvConfig._internal();

//   factory EnvConfig() => _instance;

//   EnvConfig._internal();

//   late Environment _currentEnv;
//   final dotEnv = DotEnv();

//   Future<void> init(Environment env) async {
//     _currentEnv = env;
//     final fileName = _getEnvFileName(env);
//     await dotEnv.load(fileName: 'assets/env/$fileName');
//   }

//   String _getEnvFileName(Environment env) {
//     switch (env) {
//       case Environment.dev:
//         return '.env.dev';
//       case Environment.qa:
//         return '.env.qa';
//       case Environment.prod:
//         return '.env.prod';
//       case Environment.uat:
//         return '.env.uat';
//       case Environment.demo:
//         return '.env.demo';
//       case Environment.preprod:
//         return '.env.preprod';
//     }
//   }

//   // Getters for environment variables
//   String get baseUrl => dotEnv.env['BASE_URL_API'] ?? '';
//   String get deploymentMode => dotEnv.env['DEPLOYMENT_MODE'] ?? '';
//   String get appName => dotEnv.env['APP_NAME'] ?? 'SimplifyVMS';
//   String get bundleId => dotEnv.env['BUNDLE_ID'] ?? '';

//   bool get isProduction => _currentEnv == Environment.prod;
//   bool get isDevelopment => _currentEnv == Environment.dev;
// }

// final envConfig = EnvConfig();
