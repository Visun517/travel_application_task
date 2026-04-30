import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_application/util/supabase_auth.dart';

void continueWithGoogle(BuildContext context) async {
  try {
    await AuthHelper.signInWithGoogle();

    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Failed: $e')));
    }
  }
}

Future<void> signUpUser({
  required BuildContext context,
  required String email,
  required String password,
  required String fullName,
}) async {
  try {
    final supabse = Supabase.instance.client;

    final response = await supabse.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName},
    );

    print('Signup response received. User: ${response.user}');

    if (context.mounted) {
      log('visun');
      if (response.user != null || response.session != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration Successful! Please check your email.'),
          ),
        );
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
      );
    }
  }
}

Future<void> loginUser({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  try {
    final supabse = Supabase.instance.client;

    final response = await supabse.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (context.mounted) {
      if (response.user != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
      );
    }
  }
}

Future<void> sendOtp(String email) async {
  try {
    final supabase = Supabase.instance.client;
    await supabase.auth.signInWithOtp(
      email: email,
      shouldCreateUser: false, 
    );
    print('OTP sent to $email');
  } catch (e) {
    print('Error sending OTP: $e');
  }
}
Future<bool> verifyOtp({required String email, required String otp}) async {
  try {
    final response = await Supabase.instance.client.auth.verifyOTP(
      email: email,
      token: otp,
      type: OtpType.recovery, 
    );
    return response.session != null;
  } catch (e) {
    return false;
  }
}