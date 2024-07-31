import 'package:chindi/models/location.dart';
import 'package:chindi/services/firebase_auth_service.dart';
import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:chindi/models/user.dart' as m;

class UserProvider with ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();

  m.User? _user;
  m.User? get user => _user;

  UserProvider() {
    _authService.user.listen(_handleAuthStateChanged);
  }

  Future<void> signIn(String email, String password) async {
    await _authService.signInWithEmailAndPassword(email, password);
  }

  Future<void> signUp(String fullName, String email, String password) async {
    final f.User user = await _authService.signUpWithEmailAndPassword(
      email,
      password,
    );

    final Map<String, dynamic> initialData =
        _createInitialUserData(fullName, email);

    await FirebaseFirestoreService().setUserData(user.uid, initialData);
    _updateUserFromData(initialData, user.uid);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  Future<void> updateDefaultAddress(Location address) async {
    final Map<String, dynamic> updatedProperties = {'address': address.toMap()};

    await FirebaseFirestoreService()
        .updateUserDetails(_user!.uid, updatedProperties);
    _user!.address = address;
    notifyListeners();
  }

  void _handleAuthStateChanged(f.User? firebaseUser) async {
    if (firebaseUser == null) {
      _user = null;
      notifyListeners();
      return;
    }

    final userData = await FirebaseFirestoreService().getUserData(
      firebaseUser.uid,
    );

    _updateUserFromData(userData, firebaseUser.uid);
  }

  Map<String, dynamic> _createInitialUserData(String fullName, String email) {
    return {
      'email': email,
      'fullName': fullName,
      'avatarUrl': '',
      'chatIds': [],
      'address': {
        'streetAddress': '',
        'suburb': '',
        'city': '',
        'county': '',
      },
      'rating': 0.0,
    };
  }

  void _updateUserFromData(Map<String, dynamic> userData, String uid) {
    _user = m.User.fromMap(userData, uid);
    notifyListeners();
  }
}
