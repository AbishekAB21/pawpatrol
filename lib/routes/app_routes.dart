import 'package:go_router/go_router.dart';
import 'package:pawpatrol/features/auth%20screens/signin/container/signin_container.dart';
import 'package:pawpatrol/features/auth%20screens/signup/container/signup_screen_container.dart';
import 'package:pawpatrol/features/home%20screen/container/home_screen_container.dart';
import 'package:pawpatrol/routes/app_route_paths.dart';


// Screens
import 'package:pawpatrol/features/splash%20screen/container/splash_screen_container.dart';
import 'package:pawpatrol/features/onboarding%20screens/container/onboarding_screen_container.dart';



class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutesPaths.home,

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

      GoRoute(
        path: AppRoutesPaths.home,
        builder: (context, state) => const HomeScreenContainer(),
      ),

    //   GoRoute(
    //     path: AppRoutesPaths.settings,
    //     builder: (context, state) => const DetailsScreen(),
    //   ),

    //   GoRoute(
    //     path: AppRoutesPaths.settings,
    //     builder: (context, state) => const CartScreen(),
    //   ),

    //   GoRoute(
    //     path: AppRoutesPaths.profile,
    //     builder: (context, state) => const ProfileScreen(),
    //   ),

    //   GoRoute(
    //     path: AppRoutesPaths.settings,
    //     builder: (context, state) => const SettingsScreen(),
    //   ),
     ],
  );
}