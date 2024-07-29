import 'package:chindi/models/location.dart';
import 'package:chindi/services/firebase_auth_service.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:chindi/models/user.dart' as m;

class UserProvider with ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirebaseFirestoreService _databaseService = FirebaseFirestoreService();

  m.User? _user;
  m.User? get user => _user;

  UserProvider() {
    _authService.user.listen((f.User? user) async {
      if (user == null) {
        _user = null;
        notifyListeners();
        return;
      }

      var userData = await _databaseService.getUserData(user.uid);

      // Returning if user data is null
      // TODO: Find a better way to handle this
      if (userData == null) return;

      // Creating a user map from the Firebase data
      Map<String, dynamic> userMap = createUserMapFromFirebaseData(
        user.uid,
        userData as Map<String, dynamic>,
      );

      // Using the map to create a User model and storing it in the provider
      _user = m.User.fromMap(userMap);
      notifyListeners();
    });
  }

  Map<String, dynamic> createUserMapFromFirebaseData(
    String uid,
    Map<String, dynamic> userData,
  ) {
    // Combining data from Firebase Authentication and Firestore to create a user map
    return {
      'uid': uid,
      'fullName': userData['fullName'],
      'email': userData['email'],
      'avatarUrl': userData['avatarUrl'],
      'address': userData['address'],
      'rating': userData['rating'],
    };
  }

  Future<void> signIn(String email, String password) async {
    // Signing in with Firebase
    f.User user = await _authService.signInWithEmailAndPassword(
      email,
      password,
    );

    var userData = await _databaseService.getUserData(user.uid);

    // Returning if user data is null
    // TODO: Handle this case
    if (userData == null) return;

    // Creating a user map from the Firebase data
    Map<String, dynamic> userMap = createUserMapFromFirebaseData(
      user.uid,
      userData as Map<String, dynamic>,
    );

    // Using the map to create a User model and storing it in the provider
    _user = m.User.fromMap(userMap);
    notifyListeners();
  }

  Future<void> signUp(String fullName, String email, String password) async {
    // Creating the user with Firebase authentication
    f.User user = await _authService.signUpWithEmailAndPassword(
      email,
      password,
    );

    // Creating the initial data for the user
    Map<String, dynamic> initialData = {
      'email': email,
      'fullName': fullName,
      'avatarUrl': '',
      'address': {
        'streetAddress': '',
        'suburb': '',
        'city': '',
        'county': '',
      },
      'rating': 0.0,
    };

    // Writing the initial data for the user in Firestore
    await _databaseService.setUserData(
      user.uid,
      initialData,
    );

    // Creating a user map from the Firebase data
    Map<String, dynamic> userMap = createUserMapFromFirebaseData(
      user.uid,
      initialData,
    );

    // Using the map to create a User model and storing it in the provider
    _user = m.User.fromMap(userMap);
    notifyListeners();
  }

  Future<void> signOut() async {
    // Signing out with Firebase
    _authService.signOut();

    // Clearing the user data from the provider
    _user = null;
    notifyListeners();
  }

  Future<void> updateDefaultAddress(Location address) async {
    Map<String, dynamic> updatedProperties = {
      'address': address.toMap(),
    };

    await _databaseService.updateUserDetails(
      _user!.uid,
      updatedProperties,
    );
    _user!.address = address;
    notifyListeners();
  }
}
