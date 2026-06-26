import 'package:flutter/material.dart';
import 'package:pawpatrol/common/reusable_rounded_button.dart';
import 'package:pawpatrol/core/constants/strings.dart';
import 'package:pawpatrol/features/profile%20screen/widgets/profile_card.dart';
import 'package:pawpatrol/features/profile%20screen/widgets/profile_details_widget.dart';

class ProfileScreenComponent extends StatelessWidget {
  const ProfileScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      //backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.88),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.primaryColor,
              theme.colorScheme.secondary.withValues(alpha: 0.9),
              theme.colorScheme.secondary,
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
        child: SafeArea(
          maintainBottomViewPadding: true,
          //bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.profile,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      ReusableRoundedButton(
                        onPressed: () {},
                        icon: Icons.more_horiz_rounded,
                        color: theme.colorScheme.onSurface,
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // User Profile card
                  ProfileCard(
                    profilecarddetails: ProfileCardDetailsWidget(
                      prefixWidget: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          "assets/images/profile.png",
                        ),
                      ),
                      cardTitle: "Nivi",
                      cardSubtitle: "nivi@gmail.com",
                      suffixWidget: Icon(
                        Icons.settings,
                        color: theme.colorScheme.surface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  // App Settings and other profile centric options card
                  ProfileCard(
                    profilecarddetails: Column(
                      children: [
                        // Address
                        ProfileCardDetailsWidget(
                          prefixWidget: Icon(
                            Icons.location_on_rounded,
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.7,
                            ),
                            size: 30,
                          ),
                          cardTitle: "Address Book",
                          cardSubtitle: "Manage your addresses",
                        ),

                        SizedBox(height: 20),

                        // Orders
                        ProfileCardDetailsWidget(
                          prefixWidget: Icon(
                            Icons.history,
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.7,
                            ),
                            size: 30,
                          ),
                          cardTitle: "Order History",
                          cardSubtitle: "View your past orders",
                        ),

                        SizedBox(height: 20),

                        // Language
                        ProfileCardDetailsWidget(
                          prefixWidget: Icon(
                            Icons.language_rounded,
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.7,
                            ),
                            size: 30,
                          ),
                          cardTitle: "Language",
                          cardSubtitle: "English",
                        ),

                        SizedBox(height: 20),

                        // Notifications
                        ProfileCardDetailsWidget(
                          prefixWidget: Icon(
                            Icons.notifications_rounded,
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.7,
                            ),
                            size: 30,
                          ),
                          cardTitle: "Notifications",
                          cardSubtitle: "Manage notification permissions",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.0),

                  // Customer support and conditions card
                  ProfileCard(
                    profilecarddetails: Column(
                      children: [
                        // Contact us
                        ProfileCardDetailsWidget(
                          prefixWidget: Icon(
                            Icons.phone,
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.7,
                            ),
                            size: 30,
                          ),
                          cardTitle: "Contact Us",
                          cardSubtitle: "Let us help you",
                        ),

                        SizedBox(height: 20.0),

                        // Privcy Policy
                        ProfileCardDetailsWidget(
                          prefixWidget: Icon(
                            Icons.security_rounded,
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.7,
                            ),
                            size: 30,
                          ),
                          cardTitle: "Privacy Policy",
                          cardSubtitle: "View our privacy policy",
                        ),

                        SizedBox(height: 20.0),

                        // Terms & Conditions
                        // Privcy Policy
                        ProfileCardDetailsWidget(
                          prefixWidget: Icon(
                            Icons.verified_rounded,
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.7,
                            ),
                            size: 30,
                          ),
                          cardTitle: "Terms & Conditions",
                          cardSubtitle: "View our terms & conditions",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.0),

                  // Logout & Delete account
                  ProfileCard(
                    profilecarddetails: Column(
                      children: [
                        // Logout
                        ProfileCardDetailsWidget(
                          isRed: true,
                          prefixWidget: Icon(
                            Icons.logout_rounded,
                            color: theme.colorScheme.error,
                            size: 30,
                          ),
                          cardTitle: "Logout",
                          cardSubtitle: "Logout off the applications",
                          showSuffixWidget: false,
                        ),

                        SizedBox(height: 20,),

                        // Delete account
                        ProfileCardDetailsWidget(
                          isRed: true,
                          prefixWidget: Icon(
                            Icons.delete_rounded,
                            color: theme.colorScheme.error,
                            size: 30,
                          ),
                          cardTitle: "Delete Account",
                          cardSubtitle: "Delete your account",
                          showSuffixWidget: false,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50.0,),

                  Text("Version: 1.0.0"),

                  SizedBox(height: 106.0,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
