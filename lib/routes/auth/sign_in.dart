import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/components/utils/primary_button.dart';
import 'package:chindi/providers/user_provider.dart';
import 'package:chindi/routes/auth/forgot_password.dart';
import 'package:chindi/routes/auth/sign_up.dart';
import 'package:chindi/utils/constants/colors.dart';
import 'package:chindi/components/utils/chindi_logo.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/exceptions/custom_exception.dart';
import 'package:chindi/utils/validators/validate_email.dart';
import 'package:chindi/utils/validators/validate_password.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ScaffoldFeatureController Function(SnackBar) _showSnackbar;
  late UserProvider _userProvider;

  bool _passwordObscured = true;
  String _errorMessage = '';

  Future<void> handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      _showSnackbar(
        const SnackBar(
          content: Text('Signing you in'),
        ),
      );
      try {
        String email = _emailController.text;
        String password = _passwordController.text;

        await _userProvider.signIn(email, password);
      } on CustomException catch (e) {
        setState(() {
          _errorMessage = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    _showSnackbar = ScaffoldMessenger.of(context).showSnackBar;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: ChindiSizes.fontSizeLg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: ChindiSizes.spaceBtwSections),
                CustomForm(
                  errorMessage: _errorMessage,
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
                    CustomTextFormField(
                      controller: _passwordController,
                      label: 'Password',
                      prefixIcon: Iconsax.password_check,
                      validator: validatePassword,
                      obscured: _passwordObscured,
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
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: handleSignIn,
                        label: 'Sign in',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ChindiSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: ChindiSizes.fontSizeSm,
                        color: ChindiColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: ChindiSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
