import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pawpatrol/common/resuable_text_formfield.dart';
import 'package:pawpatrol/common/reusable_filled_button.dart';
import 'package:pawpatrol/core/constants/strings.dart';
import 'package:pawpatrol/routes/app_route_paths.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class SignupScreenComponent extends StatelessWidget {
  const SignupScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          // Dog picture at the bottom
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/images/signup_image.png",
              fit: BoxFit.cover,
              scale: 1.1,
            ),
          ),

          // Glassmorphic container
          Align(
            alignment: const Alignment(0, -0.7), // very slightly above center
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
                      border: Border.all(color: ext.glassBorder, width: 1.5),
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

                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: 40,
                            child: Divider(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.3,
                              ),
                              thickness: 1,
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "${AppStrings.signupTitle} ${AppStrings.signUpLinkTitle}",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),

                        // Email
                        ResuableTextFormfield(
                          hintText: AppStrings.emailHint,
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(height: 12.0),

                        // Password
                        ResuableTextFormfield(
                          hintText: AppStrings.passwordHint,
                          prefixIcon: Icons.lock,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),

                        SizedBox(height: 22.0),

                        // Sign In Button
                        ReusableFilledButton(
                          onPressed: () {},
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),

                        SizedBox(height: 10.0,),

                        // Sign Up Link
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: () {
                              context.push(AppRoutesPaths.login);
                            },
                            child: Text(
                              AppStrings.signInTitle,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
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
