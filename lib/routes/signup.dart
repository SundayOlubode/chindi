import '../common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              const SizedBox(width: 16.0, height: 30.0),

              /// TITLE IMAGE
              Text(
                'Let\'s create your account',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20.0),

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
              Expanded(
                  child: _buildTextFormField(
                      'First Name', Icons.person_outline_sharp)),
              const SizedBox(width: 16.0),
              Expanded(
                  child: _buildTextFormField(
                      'Last Name', Icons.person_outline_sharp)),
            ],
          ),
          const SizedBox(width: 16.0, height: 20.0),
          _buildTextFormField('Email', Icons.email),
          const SizedBox(width: 16.0, height: 20.0),
          _buildTextFormField('Password', Icons.lock_sharp),
          const SizedBox(width: 16.0, height: 20.0),
          _buildTextFormField('Confirm Password', Icons.lock_sharp),

          const SizedBox(width: 16.0, height: 30.0),

          /// SIGNUP BUTTON
          SizedBox(
            width: double.infinity,
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
          ),
          const SizedBox(width: 16.0, height: 30.0),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                    text: 'Log in',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Color(int.parse('0xff381C72'))))
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
