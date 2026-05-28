import 'package:flutter/material.dart';

import '../../domain/scan_result.dart';
import '../../presentation/screens/about_screen.dart';
import '../../presentation/screens/capture_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/onboarding_screen.dart';
import '../../presentation/screens/processing_screen.dart';
import '../../presentation/screens/result_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static const onboarding = '/';
  static const home = '/home';
  static const capture = '/capture';
  static const processing = '/processing';
  static const result = '/result';
  static const about = '/about';
}

class AppRouter {
  const AppRouter._();

  static Route<void> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) => switch (settings.name) {
        AppRoutes.onboarding => const OnboardingScreen(),
        AppRoutes.home => const HomeScreen(),
        AppRoutes.capture => const CaptureScreen(),
        AppRoutes.processing => const ProcessingScreen(),
        AppRoutes.result => ResultScreen(
          result: settings.arguments is ScanResult
              ? settings.arguments! as ScanResult
              : ScanResult.demo,
        ),
        AppRoutes.about => const AboutScreen(),
        _ => const HomeScreen(),
      },
    );
  }
}
