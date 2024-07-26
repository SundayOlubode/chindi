import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/validators/validate_name.dart';
import 'package:chindi/components/profile_image.dart';
import 'package:chindi/utils/constants/texts.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _fullNameController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();
  File? _image;

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _imagePicker.pickImage(
      source: source,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> takePhoto() async {
    await pickImage(ImageSource.camera);
  }

  Future<void> selectPhoto() async {
    await pickImage(ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user!;

    // Prefilling with current values
    _fullNameController.text = user.fullName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    children: <Widget>[
                      const ProfileImage(imagePath: ChindiTexts.anesuImagePath),
                      const SizedBox(height: ChindiSizes.spaceBtwItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: takePhoto,
                            child: const Text('Take Photo'),
                          ),
                          TextButton(
                            onPressed: selectPhoto,
                            child: const Text('Select Photo'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
                CustomTextFormField(
                  label: 'Full Name',
                  validator: validateName,
                  controller: _fullNameController,
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(ChindiTexts.saveProfile),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
