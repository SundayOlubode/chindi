import 'package:chindi_ke/utils/constants/colors.dart';
import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:chindi_ke/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// IMAGE
              const Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: ChindiSizes.spaceBtwItems),

              /// TITLE IMAGE
              Text(
                ChindiTexts.signupHeaderText,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: ChindiSizes.spaceBtwItems),

              /// FORM
              _buildFormWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Form _buildFormWidget(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: _buildTextFormField('First Name', Iconsax.user)),
              const SizedBox(width: ChindiSizes.spaceBtwItems),
              Expanded(child: _buildTextFormField('Last Name', Iconsax.user)),
            ],
          ),
          const SizedBox(height: ChindiSizes.spaceBtwItems),
          _buildTextFormField('Email', Iconsax.direct),
          const SizedBox(height: ChindiSizes.spaceBtwItems),
          _buildTextFormField('Password', Iconsax.password_check),
          const SizedBox(height: ChindiSizes.spaceBtwItems),
          _buildTextFormField('Confirm Password', Iconsax.password_check),

          const SizedBox(height: ChindiSizes.spaceBtwSections),

          /// SIGNUP BUTTON
          SizedBox(
            width: double.infinity,
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
          ),
          const SizedBox(height: ChindiSizes.spaceBtwSections),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                    text: 'Log in',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: ChindiColors.primary))
              ],
            ),
          ),
        ],
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
