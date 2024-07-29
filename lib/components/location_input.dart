import 'package:chindi/components/utils/custom_form.dart';
import 'package:chindi/components/utils/custom_text_form_field.dart';
import 'package:chindi/models/location.dart';
import 'package:chindi/utils/constants/sizes.dart';
import 'package:chindi/utils/validators/validate_name.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  final void Function(Location location) onSave;
  final Location? location;
  const LocationInput({super.key, this.location, required this.onSave});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _streetAddressController = TextEditingController();
  final _suburbController = TextEditingController();
  final _cityController = TextEditingController();
  final _countyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Prefilling form with existing values
    if (widget.location != null) {
      _streetAddressController.text = widget.location!.streetAddress;
      _suburbController.text = widget.location!.suburb;
      _cityController.text = widget.location!.city;
      _countyController.text = widget.location!.county;
    }
    return CustomForm(
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
              widget.onSave(
                Location(
                  streetAddress: _streetAddressController.text,
                  suburb: _suburbController.text,
                  city: _cityController.text,
                  county: _countyController.text,
                ),
              );
            }
          },
          child: const Text('Save Default Address'),
        ),
      ],
    );
  }
}
