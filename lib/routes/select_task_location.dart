import 'package:chindi/components/location_input.dart';
import 'package:chindi/models/location.dart';
import 'package:flutter/material.dart';

class SelectTaskLocation extends StatelessWidget {
  const SelectTaskLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Task Location'),
      ),
      body: LocationInput(
        onSave: (Location location) {
          // Save location to database
          Navigator.pop(context, location);
        },
      ),
    );
  }
}
