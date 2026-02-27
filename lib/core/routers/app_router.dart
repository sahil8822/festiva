import 'package:festivo/screens/home/bottom_nave/bottom_nav.dart';
import 'package:festivo/screens/booking/bookings_screen.dart';
import 'package:festivo/screens/home/screens/home_screens.dart';
import 'package:festivo/screens/profile/profile_screen.dart';
import 'package:festivo/screens/services/services_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:festivo/screens/auth/onboarding/splash_screen.dart';
import 'package:festivo/screens/auth/authentication/login_screen.dart';
import 'package:festivo/screens/auth/authentication/signup_screen.dart';
import 'package:festivo/screens/auth/authentication/forgot_password_screen.dart';

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
      path: LoginScreen.route,
      name: LoginScreen.route,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: SignupScreen.route,
      name: SignupScreen.route,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: ForgotPasswordScreen.route,
      name: ForgotPasswordScreen.route,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

    /// ShellRoute for Bottom Navigation
    ShellRoute(
      builder: (context, state, child) => BottomNav(child: child),
      routes: [
        GoRoute(
          path: HomeScreens.route,
          name: HomeScreens.route,
          builder: (context, state) => const HomeScreens(),
        ),
        GoRoute(
          path: ServicesScreen.route,
          name: ServicesScreen.route,
          builder: (context, state) => const ServicesScreen(),
        ),
        GoRoute(
          path: BookingsScreen.route,
          name: BookingsScreen.route,
          builder: (context, state) => const BookingsScreen(),
        ),
        GoRoute(
          path: ProfileScreen.route,
          name: ProfileScreen.route,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
