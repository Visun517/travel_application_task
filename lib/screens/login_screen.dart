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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        child: Container(
          height: MediaQuery.of(context).size.height - 40, 
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          child: Column(
            children: [
              _buildHeader(),
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
                onPressed: () {},
              ),

              const Spacer(),
              _buildSignUpFooter(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackButton(), 
        const SizedBox(height: 20),
        const Center(
          child: Text('Welcome Back', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ),
        const Text(
          'Stay connected by signing in with your email and password to access your account',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
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
          onPressed: () {},
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
              onChanged: (v) => setState(() => _rememberMe = v!),
              activeColor: Colors.black,
            ),
            const Text('Remember Me'),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Forgot Password?', style: TextStyle(color: Colors.black54)),
        ),
      ],
    );
  }

  Widget _buildSignUpFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () {},
          child: const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}