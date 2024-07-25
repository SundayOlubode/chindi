import 'package:chindi/utils/validators/validate_email.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:chindi/components/utils/chindi_logo.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/primary_button.dart';
import 'package:chindi/routes/auth/reset_password.dart';

class ForgotPassword extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  formKey: _formKey,
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      label: 'Email Address',
                      prefixIcon: Iconsax.direct,
                      validator: validateEmail,
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
                              builder: (context) => ResetPassword(),
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
