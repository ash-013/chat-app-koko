import 'package:chat_app_mk/componets/custom_button.dart';
import 'package:chat_app_mk/componets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _register() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email, password and confirm password'),
        ),
      );
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 20),
            Text(
              'Let\'s get you started',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 50),

            // email text-field
            MyTextfield(
              hintTextHere: 'E-Mail',
              obscure: false,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintTextHere: 'Password',
              obscure: true,
              keyboardType: TextInputType.text,
              controller: _passwordController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintTextHere: 'Confirm Password',
              obscure: true,
              keyboardType: TextInputType.text,
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 20),
            // sign in button
            CustomButton(onTap: () => _register(), buttonLabel: 'Register'),
            // register now
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    // Navigate to the LoginPage
                    widget.onTap();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
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
