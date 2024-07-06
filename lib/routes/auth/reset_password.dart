import 'package:chindi_ke/components/utils/custom_form.dart';
import 'package:chindi_ke/components/custom_text_form_field.dart';
import 'package:chindi_ke/components/utils/chindi_logo.dart';
import 'package:chindi_ke/components/utils/primary_button.dart';
import 'package:chindi_ke/routes/auth/sign_in.dart';
import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwSections,
                ),
                CustomForm(
                  children: [
                    const CustomTextFormField(
                      label: 'Password',
                      prefixIcon: Iconsax.password_check,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    const CustomTextFormField(
                      label: 'Confirm Password',
                      prefixIcon: Iconsax.password_check,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                        label: 'Reset Password',
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
