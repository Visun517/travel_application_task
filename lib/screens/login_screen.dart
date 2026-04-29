import 'package:flutter/material.dart';
import 'package:travel_application/Components/button.dart';
import 'package:travel_application/Components/custom_text_field.dart';
import 'package:travel_application/widgets/or_devider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 40.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 0  ),
                child: CircleAvatar(
                  radius: 20, 
                  backgroundColor: Colors.grey[200],
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                      size: 22,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),

            BackButton(),

            const SizedBox(height: 30),

            Center(
              child: const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 40, color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                'Stay connected by signing in with your email and password to access your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 30),

            CustomButton(
              title: 'Continue with Google',
              icon: Image.asset('assets/images/google.png', width: 20),
              width: 300,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              onPressed: () {
                print("Google Button Pressed");
              },
            ),

            const SizedBox(height: 30),

            OrDivider(),

            const SizedBox(height: 30),

            CustomTextField(
              labelText: 'Email',
              width: 350,
              controller: _emailController,
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 30),

            CustomTextField(
              width: 350,
              labelText: 'Password',
              controller: _passwordController,
              prefixIcon: Icons.lock_outlined,
              isPassword: true,
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 25.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            CustomButton(
              title: 'Sign In',
              width: 300,
              backgroundColor: Colors.black87,
              foregroundColor: Colors.white,
              onPressed: () {
                print("Sign In Button Pressed");
              },
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
