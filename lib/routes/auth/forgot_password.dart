import 'package:chindi_ke/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/widgets.dart';
import '../../utils/constants/sizes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
              /// Add space at the top to move content lower on the screen
              const SizedBox(height: 100),

              /// IMAGE
              const Center(child: ChindiIcon()),
              const SizedBox(height: ChindiSizes.spaceBtwSections),

              /// FORM TITLE TEXT
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize:
                      ChindiSizes.fontSizeLg, // Use the size from sizes.dart
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: ChindiSizes.spaceBtwSections),

              /// FORM
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFormField('Email Address', Iconsax.direct),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),

                    /// Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Send OTP'),
                      ),
                    )
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
