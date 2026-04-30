import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; 

class AuthHelper {
  static Future<void> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        serverClientId: dotenv.env['GOOGLE_WEB_CLIENT_ID'], 
      );
      
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (idToken == null || accessToken == null) {
        throw 'No ID Token or Access Token found.';
      }

      await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      print("Logged in!");
    } catch (error) {
      print("Error in Google Auth: $error");
      rethrow; 
    }
  }

  static Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
    await GoogleSignIn().signOut();
  }
}