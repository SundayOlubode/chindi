import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:chindi_ke/utils/constants/texts.dart';
import 'package:chindi_ke/components/utils/primary_button.dart';
import '../../utils/constants/sizes.dart';

class RegisteredSuccesfully extends StatelessWidget {
  const RegisteredSuccesfully({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme globalTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///TITLE TEXT
            const Text(
              'Task Creation Successful',
              style: TextStyle(
                fontSize: ChindiSizes.fontSizeLg,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: ChindiSizes.spaceBtwSections),
            RippleAnimation(
              size: const Size(200, 200),
              repeat: false,
              duration: const Duration(milliseconds: 2300),
              ripplesCount: 8,
              color: Colors.purple,
              minRadius: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/Success.png",
                  fit: BoxFit.cover,
                  width: 100.0,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              ChindiTexts.registrationSuccessful,
              style: globalTextTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              onPressed: () {},
              label: 'More jobs',
            ),
          ],
        ),
      ),
    );
  }
}
