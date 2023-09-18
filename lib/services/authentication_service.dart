import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Signing User Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

// Function to create a new user account and store user information in Firestore
  Future<String?> signUp(String email, String password, String name) async {
    try {
      // Create a new user with email and password
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user != null) {
        // Send email verification
        // await user.sendEmailVerification(); "lATER"

        // Update the user's profile with name
        await user.updateDisplayName(name);

        // Create a new document for the user with uid
        await storeUserInfo(user.uid, name, email, password);
      }

      return null; // No error, registration successful
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password is too weak.'; // Specific error message
      } else if (e.code == 'email-already-in-use') {
        return 'The email is already in use by another account.'; // Specific error message
      }
      // Handle other Firebase Authentication exceptions as needed.
      return 'An error occurred during registration.'; // Generic error message
    } catch (e) {
      // Handle other exceptions that may occur during registration.
      return 'An error occurred during registration.'; // Generic error message
    }
  }

// Function to store  user information in Firestore
  Future<String?> storeUserInfo(
      String userId, String name, String email, String phone) async {
    try {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Create a document for the user or update an existing one
      await usersCollection.doc(userId).set({
        'Fullname': name,
        'age': email,
        'facultyID': phone,
      });
      return null; // No error, registration successful
    } catch (e) {
      // Handle other exceptions that may occur during registration.
      return 'An error occurred during registration.'; // Generic error message
    }
  }

  // Signing User In
  Future<String?> logIn(String email, String password) async {
    try {
      // Sign the user in (on Firebase)
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null; // No error, sign in successful
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.'; // Specific error message
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.'; // Specific error message
      }
      // Handle other Firebase Authentication exceptions as needed.
      return 'An error occurred during sign in.'; // Generic error message
    } catch (e) {
      // Handle other exceptions that may occur during sign in.
      return 'An error occurred during sign in.'; // Generic error message
    }
  }
}
