import 'package:chindi/models/location.dart';
import 'package:chindi/services/firebase_auth_service.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:chindi/models/user.dart' as m;

class UserProvider with ChangeNotifier {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final FirebaseFirestoreService _firebaseDatabaseService =
      FirebaseFirestoreService();

  m.User? _user;
  m.User? get user => _user;

  Future<void> signIn(String email, String password) async {
    f.User? firebaseUser =
        await _firebaseAuthService.signInWithEmailAndPassword(
      email,
      password,
    );

    if (firebaseUser != null) {
      String uid = firebaseUser.uid;
      var userData = await _firebaseDatabaseService.getUserData(uid);

      if (userData != null) {
        _user = m.User.fromFirebase(
          firebaseUser,
          userData as Map<String, dynamic>,
        );
        notifyListeners();
      }
    }
  }

  Future<void> signUp(String fullName, String email, String password) async {
    f.User? firebaseUser =
        await _firebaseAuthService.signUpWithEmailAndPassword(
      fullName,
      email,
      password,
    );

    if (firebaseUser != null) {
      Map<String, dynamic> initialData = {
        'address': {
          'streetAddress': '',
          'suburb': '',
          'city': '',
          'county': '',
        },
        'rating': 0.0,
      };
      // Initialise the user in the database
      await _firebaseDatabaseService.initialiseUser(
        firebaseUser.uid,
        initialData,
      );

      m.User user = m.User.fromFirebase(firebaseUser, initialData);
      _user = user;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _firebaseAuthService.signOut();
    _user = null;
    notifyListeners();
  }

  Future<void> updateDefaultAddress(Location address) async {
    Map<String, dynamic> updatedProperties = {
      'address': address.toMap(),
    };

    await _firebaseDatabaseService.updateUserDetails(
      _user!.uid,
      updatedProperties,
    );
    _user!.location = address;
    notifyListeners();
  }
}
