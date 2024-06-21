import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:chindi_ke/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class ListNewTask extends StatelessWidget {
  const ListNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    // Current Text theme
    final TextTheme globalTextTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(ChindiSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  // PAGE HEADLINE
                  Text(
                    ChindiTexts.heading,
                    style: globalTextTheme.headlineMedium,
                  ),
                  const SizedBox(height: ChindiSizes.spaceBtwItems),
                ],
              ),
            ),
            // FORM
          ],
        ),
      ),
    );
  }
}
