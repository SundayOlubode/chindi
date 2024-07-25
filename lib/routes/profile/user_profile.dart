import 'package:chindi/components/profile_image.dart';
import 'package:chindi/routes/chat.dart';
import 'package:chindi/routes/notifications.dart';
import 'package:chindi/routes/tasks/manage_tasks.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:chindi/components/utils/ontap_handler.dart';
import 'package:chindi/utils/constants/colors.dart';
import 'package:chindi/routes/profile/edit_profile.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  late UserProvider _userProvider;
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    final TextTheme globalTextTheme = Theme.of(context).textTheme;
    final ButtonStyle? globalButtonStyle =
        Theme.of(context).elevatedButtonTheme.style;

    Future<void> handleSignOut() async {
      _userProvider.signOut();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  const ProfileImage(imagePath: ChindiTexts.anesuImagePath),
                  const SizedBox(height: ChindiSizes.spaceBtwItems),
                  Text(
                    _userProvider.user!.fullName,
                    style: globalTextTheme.titleLarge,
                  ),
                  Text(
                    _userProvider.user!.email,
                    style: globalTextTheme.bodyMedium,
                  ),
                  const SizedBox(height: ChindiSizes.spaceBtwItems),
                  SizedBox(
                    width: 125,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: handleSignOut,
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
                          'Sign out',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                OnTapHandler(
                  context: context,
                  dest: const EditProfile(),
                  child: Text(
                    ChindiTexts.editProfile,
                    style: globalTextTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
                OnTapHandler(
                  context: context,
                  dest: const Notifications(),
                  child: Text(
                    ChindiTexts.notification,
                    style: globalTextTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
                OnTapHandler(
                  context: context,
                  dest: const ManageTasks(),
                  child: Text(
                    ChindiTexts.manageTasks,
                    style: globalTextTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
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
