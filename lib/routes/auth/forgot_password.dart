import 'package:chindi_ke/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/widgets.dart';
import '../../utils/constants/sizes.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
              Text('Forgot Password',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: ChindiSizes.spaceBtwSections),

              /// FORM
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFormField('Email Address', Iconsax.password_check),
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
