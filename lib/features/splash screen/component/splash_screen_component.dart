import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pawpatrol/routes/app_route_paths.dart';

class SplashScreenComponent extends StatefulWidget {
  const SplashScreenComponent({super.key});

  @override
  State<SplashScreenComponent> createState() => _SplashScreenComponentState();
}

class _SplashScreenComponentState extends State<SplashScreenComponent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateAwayFromSplashScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      body: Stack(
        children: [
          // Dog Image
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.00),
              child: Image.asset(
                "assets/images/splash_screen_image.png",
                height: size.height * 0.95,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo
          Positioned(
            top: size.height * 0.10,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/images/app_logo.png",
                width: size.width * 0.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void navigateAwayFromSplashScreen(BuildContext context) {
  Future.delayed(const Duration(seconds: 3), () {
    // Navigate to the next screen based on user auth state
    context.go(AppRoutesPaths.onboarding);
  });
}
