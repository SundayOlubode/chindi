import 'package:chindi/components/utils/chindi_logo.dart';
import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/components/utils/primary_button.dart';
import 'package:chindi/routes/auth/sign_in.dart';
import 'package:chindi/routes/home.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/constants/texts.dart';
import 'package:chindi/utils/exceptions/custom_exception.dart';
import 'package:chindi/utils/validators/validate_email.dart';
import 'package:chindi/utils/validators/validate_name.dart';
import 'package:chindi/utils/validators/validate_password.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late UserProvider _userProvider;

  bool _passwordObscured = true;
  bool _confirmPasswordObscured = true;
  String _errorMessage = '';

  Future<void> handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text == _confirmPasswordController.text) {
        String fullName = _fullNameController.text;
        String email = _emailController.text;
        String password = _passwordController.text;

        try {
          await _userProvider.signUp(fullName, email, password);

          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Wrapper()),
              (route) => false,
            );
          }
        } on CustomException catch (e) {
          setState(() {
            _errorMessage = e.message;
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Passwords do not match.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  errorMessage: _errorMessage,
                  formKey: _formKey,
                  children: <Widget>[
                    CustomTextFormField(
                      controller: _fullNameController,
                      label: 'Full Name',
                      prefixIcon: Iconsax.user,
                      validator: validateName,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      label: 'Email',
                      prefixIcon: Iconsax.direct,
                      validator: validateEmail,
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    CustomTextFormField(
                      obscured: _passwordObscured,
                      controller: _passwordController,
                      label: 'Password',
                      prefixIcon: Iconsax.password_check,
                      validator: validatePassword,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordObscured = !_passwordObscured;
                          });
                        },
                        child: Icon(
                          _passwordObscured ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwItems,
                    ),
                    CustomTextFormField(
                      obscured: _confirmPasswordObscured,
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                      prefixIcon: Iconsax.password_check,
                      validator: validatePassword,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _confirmPasswordObscured =
                                !_confirmPasswordObscured;
                          });
                        },
                        child: Icon(
                          _confirmPasswordObscured
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: ChindiSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: handleSignUp,
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
