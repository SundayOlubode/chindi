import 'package:chindi_ke/components/utils/custom_form.dart';
import 'package:chindi_ke/components/custom_text_form_field.dart';
import 'package:chindi_ke/components/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../components/utils/chindi_logo.dart';
import '../../utils/constants/sizes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Center(
                  child: ChindiLogo(),
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwSections,
                ),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: ChindiSizes.fontSizeLg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwSections,
                ),
                CustomForm(
                  children: [
                    const CustomTextFormField(
                      label: 'Email Address',
                      prefixIcon: Iconsax.direct,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    PrimaryButton(
                      onPressed: () {},
                      label: 'Send OTP',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
