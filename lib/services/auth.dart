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
    final supabase = Supabase.instance.client;
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    }
  } on AuthException catch (error) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message), backgroundColor: Colors.red),
      );
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unexpected error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

Future<void> sendOtp(String email) async {
  try {
    final supabase = Supabase.instance.client;
    await supabase.auth.signInWithOtp(email: email, shouldCreateUser: false);
  } catch (e) {
    log(e.toString());
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
