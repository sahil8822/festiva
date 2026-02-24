import 'package:festivo/screens/home/screens/home_screens.dart';
import 'package:go_router/go_router.dart';
import 'package:festivo/screens/auth/onboding/onboding_screen.dart';
import 'package:festivo/screens/auth/onboding/splash_screen.dart';

/// App router configuration using GoRouter
final GoRouter appRouter = GoRouter(
  initialLocation: SplashScreen.route,
  routes: [
    GoRoute(
      path: SplashScreen.route,
      name: SplashScreen.route,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: OnbodingScreen.route,
      name: OnbodingScreen.route,
      builder: (context, state) => const OnbodingScreen(),
    ),
    GoRoute(
      path: HomeScreens.route,
      name: HomeScreens.route,
      builder: (context, state) => const HomeScreens(),
    ),
  ],
);
