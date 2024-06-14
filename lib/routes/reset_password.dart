import 'package:flutter/material.dart';
import '../common/widgets/widgets.dart';

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
              const SizedBox(width: 16.0, height: 30.0),

              /// FORM TITLE TEXT
              Text('Reset Password',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20.0),

              /// FORM
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFormField('Password', Icons.lock_sharp),
                    const SizedBox(height: 16.0),
                    _buildTextFormField('Confirm Password', Icons.lock_sharp),
                    const SizedBox(height: 16.0),
                    Text('Password does not match',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.red)),
                    const SizedBox(height: 25.0),

                    /// Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Reset Password',
                            style: Theme.of(context).textTheme.bodyMedium),
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
