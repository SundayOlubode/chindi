import 'package:chindi/components/sign_out_button.dart';
import 'package:chindi/routes/chat.dart';
import 'package:chindi/routes/edit_default_address.dart';
import 'package:chindi/routes/notifications.dart';
import 'package:chindi/routes/tasks/manage_tasks.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:chindi/routes/profile/edit_profile.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final List<Map<String, dynamic>> _links = [
    {
      'title': 'Edit Profile',
      'widget': const EditProfile(),
    },
    {
      'title': 'Notifications',
      'widget': const Notifications(),
    },
    {
      'title': 'Manage Tasks',
      'widget': const ManageTasks(),
    },
    {
      'title': 'Contact Support',
      'widget': const Chat(),
    },
    {
      'title': 'Edit Default Address',
      'widget': const EditDefaultAddress(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    final TextTheme globalTextTheme = Theme.of(context).textTheme;
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userProvider.user!.fullName,
                    style: globalTextTheme.titleLarge,
                  ),
                  Text(
                    userProvider.user!.email,
                    style: globalTextTheme.bodyMedium,
                  ),
                ],
              ),
              const SignOutButton(),
            ],
          ),
          const SizedBox(height: ChindiSizes.spaceBtwSections),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
                itemCount: _links.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_links[index]['title']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _links[index]['widget'],
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
