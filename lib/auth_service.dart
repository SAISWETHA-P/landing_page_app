import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        "568198726125-lnqiiue587ri2da7s8pgi385q9hec87r.apps.googleusercontent.com", // Add your Web Client ID here
  );

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Step 1: Sign in with Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("Google Sign-In canceled.");
        return null;
      }

      // Step 2: Authenticate with Firebase
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Step 3: Get user data
      final User? user = userCredential.user;
      if (user != null) {
        final userData = {
          "googleId": user.uid,
          "name": user.displayName,
          "email": user.email,
          "profilePic": user.photoURL,
        };

        // Step 4: Send data to MongoDB backend
        final response = await http.post(
          Uri.parse(
              "http://localhost:5000/api/auth/google"), // Update with backend URL
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(userData),
        );

        if (response.statusCode == 200) {
          print("✅ User data stored successfully!");
        } else {
          print("❌ Failed to store user: ${response.body}");
        }
      }

      return userCredential;
    } catch (e) {
      print("❌ Google Sign-In Error: $e");
      return null;
    }
  }

  // Sign out function
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    print("👋 User signed out.");
  }
}
