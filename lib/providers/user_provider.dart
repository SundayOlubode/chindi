import 'package:chindi/services/auth.dart';
import 'package:chindi/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:chindi/models/user.dart' as m;

class UserProvider with ChangeNotifier {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final FirebaseDatabaseService _firebaseDatabaseService =
      FirebaseDatabaseService();

  m.User? _user;
  m.User? get user => _user;

  Future<void> signIn(String email, String password) async {
    f.User? firebaseUser =
        await _firebaseAuthService.signInWithEmailAndPassword(
      email,
      password,
    );

    if (firebaseUser != null) {
      Map<String, dynamic>? userData =
          await _firebaseDatabaseService.getUserData(firebaseUser.uid);

      if (userData != null) {
        _user = m.User.fromFirebase(firebaseUser, userData);
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
}
