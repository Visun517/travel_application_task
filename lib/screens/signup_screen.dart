import 'package:flutter/material.dart';
import 'package:travel_application/Components/button.dart';
import 'package:travel_application/Components/custom_text_field.dart';
import 'package:travel_application/screens/login_screen.dart';
import 'package:travel_application/services/authService.dart';
import 'package:travel_application/widgets/customer_header.dart';
import 'package:travel_application/widgets/footer.dart';
import 'package:travel_application/widgets/or_devider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _termsAccepted = false;

  final auth = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
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
                title: 'Create your account',
                description:
                    'Provide your full name, email, and password to create your account and get started',
                textSize: 35.0,
                targetScreen: const LoginScreen(),
              ),

              const SizedBox(height: 30),

              CustomButton(
                title: 'Continue with Google',
                icon: Image.asset('assets/images/google.png', width: 20),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                onPressed: () {
                  auth.continueWithGoogle(context);
                },
              ),
              const SizedBox(height: 20),

              const OrDivider(),

              const SizedBox(height: 20),

              CustomTextField(
                labelText: 'Full Name',
                controller: _fullNameController,
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),

              Row(
                children: [
                  Checkbox(
                    value: _termsAccepted,
                    onChanged: (v) => setState(() => _termsAccepted = v!),
                    activeColor: Colors.black,
                  ),
                  const Text('I agree to the Terms and Conditions'),
                ],
              ),

              const SizedBox(height: 20),

              CustomButton(
                title: 'Sign Up',
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                onPressed: () {
                  if (_fullNameController.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  }

                  if (!_termsAccepted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please accept the Terms and Conditions'),
                      ),
                    );
                    return;
                  }

                  if (_termsAccepted) {
                    auth.signUpUser(
                      context: context,
                      fullName: _fullNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  }
                },
              ),

              const Spacer(),

              AuthFooter(
                leadingText: "Don't have an account? ",
                actionText: "Sign In",
                targetScreen: const LoginScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
