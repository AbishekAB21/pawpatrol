import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pawpatrol/features/auth%20screens/signin/container/signin_container.dart';
import 'package:pawpatrol/features/auth%20screens/signup/container/signup_screen_container.dart';
import 'package:pawpatrol/features/home%20screen/container/home_screen_container.dart';
import 'package:pawpatrol/features/main%20shell/main_shell.dart';
import 'package:pawpatrol/features/orders%20screen/container/order_screen_container.dart';
import 'package:pawpatrol/features/profile%20screen/container/profile_screen_container.dart';
import 'package:pawpatrol/features/wishlist%20screen/container/wishlist_screen_container.dart';
import 'package:pawpatrol/routes/app_route_paths.dart';
import 'package:pawpatrol/features/splash%20screen/container/splash_screen_container.dart';
import 'package:pawpatrol/features/onboarding%20screens/container/onboarding_screen_container.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutesPaths.splash,
    routes: [
      GoRoute(
        path: AppRoutesPaths.splash,
        builder: (context, state) => const SplashScreenContainer(),
      ),
      GoRoute(
        path: AppRoutesPaths.onboarding,
        builder: (context, state) => const OnboardingScreenContainer(),
      ),
      GoRoute(
        path: AppRoutesPaths.login,
        builder: (context, state) => const SigninContainer(),
      ),
      GoRoute(
        path: AppRoutesPaths.signup,
        builder: (context, state) => const SignupScreenContainer(),
      ),

      // Shell wraps all main app tabs — nav bar stays alive across them
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutesPaths.home,
            builder: (context, state) => const HomeScreenContainer(),
          ),
          GoRoute(
            path: AppRoutesPaths.orders,
            builder: (context, state) => const OrderScreenContainer(),
          ),
          GoRoute(
            path: AppRoutesPaths.wishlist,
            builder: (context, state) => const WishlistScreenContainer(),
          ),
          GoRoute(
            path: AppRoutesPaths.profile,
            builder: (context, state) => const ProfileScreenContainer(),
          ),
        ],
      ),
    ],
  );
}