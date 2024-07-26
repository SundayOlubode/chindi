import 'package:chindi/services/firebase_firestore_service.dart';
import 'package:chindi/utils/exceptions/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuthService() {
    if (kDebugMode) {
      _auth.useAuthEmulator('localhost', 9099);
    }
  }

  FirebaseFirestoreService database = FirebaseFirestoreService();

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      Map<String, String> errorCodeToMessage = {
        'user-not-found': 'The user with email: $email was not found.',
        'wrong-password': 'Incorrect password entered.',
        'too-many-requests': 'Too many requests. Try again later',
        'user-disabled': 'The user with email: $email has been disabled.',
        'invalid-email': 'The email entered is not a valid email address.',
        'channel-error': 'A channel error occurred. Please try again later.',
        'invalid-credential': 'The provided credential is invalid.'
      };

      throw CustomException(
        errorCodeToMessage[e.code] ??
            'An error occured. Please try again later.',
      );
    } catch (e) {
      throw CustomException('An error occurred. Please try again later.');
    }
  }

  Future<User?> signUpWithEmailAndPassword(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      // Create user with specified email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If user creation was successful
      if (userCredential.user != null) {
        // Update the user's display name
        await userCredential.user!.updateDisplayName(fullName);

        return userCredential.user!;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      print(e);
      Map<String, String> errorCodeToMessage = {
        'email-already-in-use': 'An account with email $email already exists.',
        'invalid-email': 'The email address entered is not valid.',
        'operation-not-allowed': 'The attempted operation is not allowed',
        'weak-password': 'The password you entered is too weak.',
      };

      throw CustomException(
        errorCodeToMessage[e.code] ??
            'An error occured. Please try again later.',
      );
    } catch (e) {
      print(e);
      throw CustomException(
        'An error occured. Please try again later.',
      );
    }
  }

  Future<void> requestPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> verifyPasswordReset(String otp, String newPassword) async {
    await _auth.confirmPasswordReset(code: otp, newPassword: newPassword);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> updateDisplayName(String displayName) async {
    await _auth.currentUser!.updateDisplayName(displayName);
  }
}
