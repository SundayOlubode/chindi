import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/components/utils/heading.dart';
import 'package:chindi/utils/validators/validate_otp.dart';
import 'package:chindi/utils/validators/validate_password.dart';
import 'package:flutter/material.dart';
import 'package:chindi/components/utils/primary_button.dart';
import 'package:iconsax/iconsax.dart';
import 'package:chindi/components/utils/chindi_logo.dart';
import 'package:chindi/utils/constants/sizes.dart';

class ResetPassword extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: ChindiLogo(),
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwSections,
                ),
                const Center(
                  child: Heading('Reset Password'),
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwItems,
                ),
                const Text(
                  'Please verify the one-time password that has been sent to your email account.',
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwItems,
                ),
                const Text('The OTP expires in 10 minutes'),
                const SizedBox(
                  height: ChindiSizes.spaceBtwItems,
                ),
                CustomForm(
                  formKey: _formKey,
                  children: [
                    CustomTextFormField(
                      controller: _otpController,
                      label: 'OTP',
                      prefixIcon: Iconsax.password_check,
                      validator: validateOtp,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      label: 'Password',
                      prefixIcon: Iconsax.password_check,
                      validator: validatePassword,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                      prefixIcon: Iconsax.password_check,
                      validator: validatePassword,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: () {},
                        label: 'Verify OTP',
                      ),
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
