import 'package:chindi_ke/components/custom_form.dart';
import 'package:chindi_ke/components/custom_text_form_field.dart';
import 'package:chindi_ke/components/primary_button.dart';
import 'package:chindi_ke/utils/constants/colors.dart';
import 'package:chindi_ke/components/chindi_logo.dart';
import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: ChindiLogo(),
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwSections,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: ChindiSizes.fontSizeLg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwSections),
                CustomForm(
                  children: [
                    const CustomTextFormField(
                      label: 'Email Address',
                      prefixIcon: Iconsax.direct,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    const CustomTextFormField(
                      label: 'Password',
                      prefixIcon: Iconsax.password_check,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    PrimaryButton(
                      onPressed: () {},
                      label: 'Log in',
                    ),
                  ],
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
                Center(
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: ChindiSizes.fontSizeSm,
                      color: ChindiColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
