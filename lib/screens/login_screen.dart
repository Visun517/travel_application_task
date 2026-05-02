import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/Components/button.dart';
import 'package:travel_application/Components/custom_text_field.dart';
import 'package:travel_application/screens/otp_screen.dart';
import 'package:travel_application/screens/signup_screen.dart';
import 'package:travel_application/services/auth.dart';
import 'package:travel_application/widgets/customer_header.dart';
import 'package:travel_application/widgets/footer.dart';
import 'package:travel_application/widgets/or_devider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 40,
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          child: Column(
            children: [
              CustomHeader(
                title: 'Welcome Back',
                description:
                    'Stay connected by signing in with your email and password to access your account',
                textSize: 50.0,
              ),
              const SizedBox(height: 30),

              _buildSocialLogin(),
              const SizedBox(height: 30),

              // Form Fields
              CustomTextField(
                labelText: 'Email',
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Password',
                controller: _passwordController,
                prefixIcon: Icons.lock_outlined,
                isPassword: true,
              ),

              _buildRememberMeRow(),
              const SizedBox(height: 30),

              CustomButton(
                title: 'Sign In',
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                onPressed: _isLoading
                    ? null
                    : () async {
                        setState(() => _isLoading = true);

                        await loginUser(
                          context: context,
                          ref: ref,
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                        );

                        if (mounted) setState(() => _isLoading = false);
                      },
              ),

              const Spacer(),
              AuthFooter(
                leadingText: "Don't have an account? ",
                actionText: "Sign Up",
                targetScreen: const SignupScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        CustomButton(
          title: 'Continue with Google',
          icon: Image.asset('assets/images/google.png', width: 20),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          onPressed: () {
            continueWithGoogle(context);
          },
        ),
        const SizedBox(height: 20),
        const OrDivider(),
      ],
    );
  }

  Widget _buildRememberMeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (bool? value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
              },
              activeColor: Colors.black,
            ),
            const Text("Remember Me", style: TextStyle(fontSize: 16)),
          ],
        ),
        TextButton(
          onPressed: () async {
            final email = _emailController.text.trim();

            if (email.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter your email first')),
              );
              return;
            }

            await sendOtp(email);

            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OTPScreen(email: email),
                ),
              );
            }
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
