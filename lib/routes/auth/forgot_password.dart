import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:chindi/components/utils/chindi_logo.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/components/custom_text_form_field.dart';
import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/primary_button.dart';
import 'package:chindi/routes/auth/verify_otp.dart';

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
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerifyOtp(),
                            ),
                          );
                        },
                        label: 'Send OTP',
                      ),
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
