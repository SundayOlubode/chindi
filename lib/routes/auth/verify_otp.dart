import 'package:chindi_ke/components/heading.dart';
import 'package:chindi_ke/components/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:chindi_ke/components/input_field.dart';
import 'package:chindi_ke/components/primary_button.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 150,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Heading('Verify OTP'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Please verify the one-time password that has been sent to your email account.',
                ),
                const SizedBox(
                  height: 30,
                ),
                const InputField(label: 'OTP'),
                const SizedBox(
                  height: 20,
                ),
                const Text('The OTP expires in 10 minutes'),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(onPressed: () {}, label: 'Verify OTP'),
                SecondaryButton(onPressed: () {}, label: 'Resend OTP'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
