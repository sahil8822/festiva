import 'package:go_router/go_router.dart';
import 'package:festivo/main.dart';
import 'package:festivo/screens/auth/onboding/onboding_screen.dart';

/// App router configuration using GoRouter
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'onboarding',
      builder: (context, state) => const OnbodingScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
