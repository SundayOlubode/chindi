import 'package:chindi/components/location_input.dart';
import 'package:chindi/models/location.dart';
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
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user!;

    // on save function
    void handleSave(Location location) {
      userProvider.updateDefaultAddress(location);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Default Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LocationInput(
          onSave: handleSave,
          location: user.address,
        ),
      ),
    );
  }
}
