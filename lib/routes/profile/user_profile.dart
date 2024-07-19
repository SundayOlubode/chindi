import 'package:chindi/components/profile_image.dart';
import 'package:chindi/routes/auth/sign_in.dart';
import 'package:chindi/routes/chat.dart';
import 'package:chindi/routes/notifications.dart';
import 'package:chindi/routes/tasks/manage_tasks.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:chindi/components/utils/ontap_handler.dart';
import 'package:chindi/utils/constants/colors.dart';
import 'package:chindi/routes/profile/edit_profile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Current Text theme
    final TextTheme globalTextTheme = Theme.of(context).textTheme;
    // Current elevated button theme
    final ButtonStyle? globalButtonStyle =
        Theme.of(context).elevatedButtonTheme.style;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  // USER PROFILE IMAGE
                  const ProfileImage(imagePath: ChindiTexts.anesuImagePath),
                  const SizedBox(height: ChindiSizes.spaceBtwItems),

                  // USER NAME
                  Text(
                    ChindiTexts.anesuKafesu,
                    style: globalTextTheme.titleLarge,
                  ),

                  // USER EMAIL
                  Text(
                    ChindiTexts.anesuEmail,
                    style: globalTextTheme.bodyMedium,
                  ),
                  const SizedBox(height: ChindiSizes.spaceBtwItems),

                  // LOGOUT BUTTON
                  SizedBox(
                    width: 125,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      style: globalButtonStyle?.copyWith(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          ChindiColors.logoutBkgrdColor,
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          ChindiTexts.logout,
                          style: globalTextTheme.bodyMedium?.copyWith(
                            color: ChindiColors.logoutTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ChindiSizes.spaceBtwSections),

            // PROFILE SETTING OPTIONS
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // EDIT PROFILE
                OnTapHandler(
                  context: context,
                  dest: const EditProfile(),
                  child: Text(
                    ChindiTexts.editProfile,
                    style: globalTextTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),

                // NOTIFICATION
                OnTapHandler(
                  context: context,
                  dest: const Notifications(),
                  child: Text(
                    ChindiTexts.notification,
                    style: globalTextTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),

                // MANAGE TASKS
                OnTapHandler(
                  context: context,
                  dest: const ManageTasks(),
                  child: Text(
                    ChindiTexts.manageTasks,
                    style: globalTextTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),

                // SUPPORT
                OnTapHandler(
                  context: context,
                  dest: const Chat(),
                  child: Text(
                    ChindiTexts.support,
                    style: globalTextTheme.bodyLarge,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
