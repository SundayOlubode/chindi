import 'package:chindi_ke/components/utils/chindi_logo.dart';
import 'package:chindi_ke/components/utils/custom_form.dart';
import 'package:chindi_ke/components/custom_text_form_field.dart';
import 'package:chindi_ke/components/utils/primary_button.dart';
import 'package:chindi_ke/routes/auth/sign_in.dart';
import 'package:chindi_ke/routes/home.dart';
import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:chindi_ke/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: ChindiLogo(),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
                Text(
                  ChindiTexts.signupHeaderText,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
                CustomForm(
                  children: <Widget>[
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextFormField(
                            label: 'First Name',
                            prefixIcon: Iconsax.user,
                          ),
                        ),
                        SizedBox(width: ChindiSizes.spaceBtwItems),
                        Expanded(
                          child: CustomTextFormField(
                            label: 'Last Name',
                            prefixIcon: Iconsax.user,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    const CustomTextFormField(
                      label: 'Email',
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
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        label: 'Sign Up',
                      ),
                    ),
                    const SizedBox(height: ChindiSizes.spaceBtwSections),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignIn(),
                              ),
                            );
                          },
                          child: const Text('Sign in'),
                        )
                      ],
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
