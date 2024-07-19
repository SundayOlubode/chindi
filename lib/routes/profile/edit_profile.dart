import 'package:chindi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../components/profile_image.dart';
import '../../utils/constants/texts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Current Text theme
    final TextTheme globalTextTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
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
                          Text(ChindiTexts.takePhoto,
                              style: globalTextTheme.bodyLarge),
                          Text(ChindiTexts.selectPhoto,
                              style: globalTextTheme.bodyLarge),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwSections),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _buildProfileTextField(
                            ChindiTexts.firstname,
                            ChindiTexts.anesu,
                          ),
                        ),
                        const SizedBox(width: ChindiSizes.spaceBtwItems),
                        Expanded(
                          child: _buildProfileTextField(
                            ChindiTexts.lastname,
                            ChindiTexts.kafesu,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),
                    _buildProfileTextField(
                      ChindiTexts.email,
                      ChindiTexts.anesuEmail,
                    ),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),
                    Row(
                      children: [
                        Expanded(
                          child: _buildProfileTextField(
                            ChindiTexts.street,
                            ChindiTexts.anesuStreet,
                          ),
                        ),
                        const SizedBox(width: ChindiSizes.spaceBtwItems),
                        Expanded(
                          child: _buildProfileTextField(
                            ChindiTexts.village,
                            ChindiTexts.anesuVillage,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),
                    Row(
                      children: [
                        Expanded(
                          child: _buildProfileTextField(
                            ChindiTexts.ward,
                            ChindiTexts.anesuWard,
                          ),
                        ),
                        const SizedBox(width: ChindiSizes.spaceBtwItems),
                        Expanded(
                          child: _buildProfileTextField(
                            ChindiTexts.subCounty,
                            ChindiTexts.anesuSubCounty,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),
                    _buildProfileTextField(
                      ChindiTexts.county,
                      ChindiTexts.anesuCounty,
                    ),
                  ],
                ),
                const SizedBox(height: ChindiSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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

  TextField _buildProfileTextField(String labelText, String hintText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null, // Allow the TextField to expand vertically as needed
      minLines: 1, // Set a minimum number of visible lines
      scrollController: ScrollController(),
    );
  }
}
