import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:chindi_ke/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class ListNewTask extends StatelessWidget {
  const ListNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    // Current Text theme
    final TextTheme globalTextTheme = Theme.of(context).textTheme;
    // Current elevated button theme
    final ButtonStyle? globalButtonStyle =
        Theme.of(context).elevatedButtonTheme.style;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
