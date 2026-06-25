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
  static CustomTransitionPage<void> _fadePage({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutesPaths.splash,
    routes: [
      GoRoute(
        path: AppRoutesPaths.splash,
        pageBuilder: (context, state) =>
            _fadePage(key: state.pageKey, child: const SplashScreenContainer()),
      ),
      GoRoute(
        path: AppRoutesPaths.onboarding,
        pageBuilder: (context, state) => _fadePage(
          key: state.pageKey,
          child: const OnboardingScreenContainer(),
        ),
      ),
      GoRoute(
        path: AppRoutesPaths.login,
        pageBuilder: (context, state) =>
            _fadePage(key: state.pageKey, child: const SigninContainer()),
      ),

      GoRoute(
        path: AppRoutesPaths.signup,
        pageBuilder: (context, state) =>
            _fadePage(key: state.pageKey, child: const SignupScreenContainer()),
      ),

      // Shell wraps all main app tabs — nav bar stays alive across them
      ShellRoute(
        pageBuilder: (context, state, child) => CustomTransitionPage(
          key: state.pageKey,
          child: MainShell(child: child),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 200),
        ),
        routes: [
          GoRoute(
            path: AppRoutesPaths.home,
            pageBuilder: (context, state) => _fadePage(
              key: state.pageKey,
              child: const HomeScreenContainer(),
            ),
          ),
          GoRoute(
            path: AppRoutesPaths.orders,
            pageBuilder: (context, state) => _fadePage(
              key: state.pageKey,
              child: const OrderScreenContainer(),
            ),
          ),
          GoRoute(
            path: AppRoutesPaths.wishlist,
            pageBuilder: (context, state) => _fadePage(
              key: state.pageKey,
              child: const WishlistScreenContainer(),
            ),
          ),
          GoRoute(
            path: AppRoutesPaths.profile,
            pageBuilder: (context, state) => _fadePage(
              key: state.pageKey,
              child: const ProfileScreenContainer(),
            ),
          ),
        ],
      ),
    ],
  );
}
