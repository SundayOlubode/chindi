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
              Text('Reset Password',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: ChindiSizes.spaceBtwSections),

              /// FORM
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFormField('Password', Iconsax.password_check),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),
                    _buildTextFormField(
                        'Confirm Password', Iconsax.password_check),
                    const SizedBox(height: ChindiSizes.spaceBtwItems),
                    Text('Password does not match',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ChindiColors.error)),
                    const SizedBox(height: ChindiSizes.spaceBtwSections),

                    /// Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Reset Password'),
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
