import 'package:chindi_ke/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/widgets.dart';
import '../../utils/constants/sizes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// IMAGE
              const Center(child: ChindiIcon()),
              const SizedBox(height: ChindiSizes.spaceBtwSections),

              /// FORM TITLE TEXT
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: ChindiSizes.fontSizeLg, // Use the size from sizes.dart
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: ChindiSizes.spaceBtwSections),

              /// FORM
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFormField('Email Address', Iconsax.password_check),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),
                    _buildTextFormField(
                        'Password', Iconsax.password_check),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),

                    /// Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),

                    /// Add space between button and text
                    const SizedBox(height: ChindiSizes.spaceBtwItems),

                    /// Centered Forgot Password Text
                    Center(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: ChindiSizes.fontSizeSm,
                          color: ChindiColors.primary,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    const SizedBox(height: ChindiSizes.spaceBtwItems),
                    
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                            fontSize: ChindiSizes.fontSizeSm,
                            color: ChindiColors.textSecondary,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                fontSize: ChindiSizes.fontSizeSm,
                                color: ChindiColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String text, IconData prefixIcon,
      [IconData? suffixIcon]) {
    return TextFormField(
      expands: false,
      decoration: InputDecoration(
        labelText: text,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}
