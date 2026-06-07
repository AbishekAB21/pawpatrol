import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pawpatrol/core/constants/strings.dart';
import 'package:pawpatrol/routes/app_route_paths.dart';
import 'dart:ui';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class OnboardingScreenComponent extends StatefulWidget {
  const OnboardingScreenComponent({super.key});

  @override
  State<OnboardingScreenComponent> createState() =>
      _OnboardingScreenComponentState();
}

class _OnboardingScreenComponentState extends State<OnboardingScreenComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    // Pop-up spring scale: starts small, overshoots slightly, settles
    _scaleAnim = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Stack(
        children: [
          // ── Top cats — pulled UP so only ~40% of image shows ──────
          Positioned(
            top: -(screenHeight * 0.05), // pull upward
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/cats_upper.png",
              fit: BoxFit.cover,
              scale: 1.1,
            ),
          ),

          // ── Bottom cats — pulled DOWN ─────────────────────────────
          Positioned(
            bottom: -(screenHeight * 0.057), // pull downward
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/cats_lower.png",
              fit: BoxFit.cover,
              scale: 1.1,
            ),
          ),

          // ── Glass card — centered with more breathing room ────────
          Align(
            alignment: const Alignment(0, -0.05), // very slightly above center
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: ScaleTransition(
                  scale: _scaleAnim,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 28,
                          ),
                          decoration: BoxDecoration(
                            color: ext.glassBackground,
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: ext.glassBorder,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 32,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/app_logo.png",
                                width: screenHeight * 20.0,
                              ),
                             
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: SizedBox(
                                  width: 40,
                                  child: Divider(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.3),
                                    thickness: 1,
                                  ),
                                ),
                              ),
                              Text(
                                AppStrings.onboardingSubtitle,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── CTA button — floated above bottom cats ────────────────
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.05),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: FilledButton(
                  onPressed: () {
                    context.go(AppRoutesPaths.login);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary.withValues(
                      alpha: 0.5,
                    ),
                    foregroundColor: theme.colorScheme.onSurface,
                    minimumSize: const Size(64, 64),
                    shape: CircleBorder(
                      side: BorderSide(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                        width: 3,
                      ),
                    ),
                    elevation: 6,
                    //shadowColor: Colors.black.withValues(alpha: 0.3),
                  ),
                  child: Text(
                    "🐾",
                    style: TextStyle(
                      fontSize: 32,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
