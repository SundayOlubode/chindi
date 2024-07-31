import 'package:chindi/components/utils/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/validators/validate_name.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _fullName = '';

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
          child: CustomForm(
            formKey: _formKey,
            children: [
              const SizedBox(height: ChindiSizes.spaceBtwItems),
              CustomTextFormField(
                label: 'Full Name',
                validator: validateName,
                initialValue: user.fullName,
                onChanged: (e) {
                  // _fullName = e;
                },
              ),
              const SizedBox(height: ChindiSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
