import 'package:chindi_ke/components/utils/custom_form.dart';
import 'package:chindi_ke/components/custom_text_form_field.dart';
import 'package:chindi_ke/components/utils/heading.dart';
import 'package:flutter/material.dart';
import 'package:chindi_ke/components/utils/primary_button.dart';
import 'package:iconsax/iconsax.dart';
import 'package:chindi_ke/components/utils/chindi_logo.dart';
import 'package:chindi_ke/utils/constants/sizes.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: Column(
              children: [
                const Center(
                  child: ChindiLogo(),
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwSections,
                ),
                const Heading('Verify OTP'),
                const SizedBox(
                  height: ChindiSizes.spaceBtwItems,
                ),
                const Text(
                  'Please verify the one-time password that has been sent to your email account.',
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwItems,
                ),
                CustomForm(
                  children: [
                    const CustomTextFormField(
                      label: 'OTP',
                      prefixIcon: Iconsax.password_check,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    const Text('The OTP expires in 10 minutes'),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                      onPressed: () {},
                      label: 'Verify OTP',
                    ),
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
