import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/models/location.dart';
import 'package:chindi/utils/validators/validate_name.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chindi/models/user.dart';
import 'package:chindi/providers/user_provider.dart';

class EditDefaultAddress extends StatefulWidget {
  const EditDefaultAddress({super.key});

  @override
  State<EditDefaultAddress> createState() => _EditDefaultAddressState();
}

class _EditDefaultAddressState extends State<EditDefaultAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _streetAddressController = TextEditingController();
  final _suburbController = TextEditingController();
  final _cityController = TextEditingController();
  final _countyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user!;

    // Prefilling form with existing values
    _streetAddressController.text = user.location.streetAddress;
    _suburbController.text = user.location.suburb;
    _cityController.text = user.location.city;
    _countyController.text = user.location.county;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Default Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomForm(
          formKey: _formKey,
          children: [
            const SizedBox(height: ChindiSizes.spaceBtwItems),
            CustomTextFormField(
              label: 'Street Address',
              validator: validateName,
              controller: _streetAddressController,
            ),
            const SizedBox(height: ChindiSizes.spaceBtwItems),
            CustomTextFormField(
              label: 'Suburb',
              validator: validateName,
              controller: _suburbController,
            ),
            const SizedBox(height: ChindiSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    label: 'City',
                    validator: validateName,
                    controller: _cityController,
                  ),
                ),
                const SizedBox(width: ChindiSizes.spaceBtwItems),
                Expanded(
                  child: CustomTextFormField(
                    label: 'County',
                    validator: validateName,
                    controller: _countyController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: ChindiSizes.spaceBtwSections),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  userProvider.updateDefaultAddress(
                    Location(
                      streetAddress: _streetAddressController.text,
                      suburb: _suburbController.text,
                      city: _cityController.text,
                      county: _countyController.text,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Save Default Address'),
            ),
          ],
        ),
      ),
    );
  }
}
