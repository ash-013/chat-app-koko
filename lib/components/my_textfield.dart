import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintTextHere;
  final bool obscure;
  final TextEditingController controller; // ✅ This is crucial
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  const MyTextfield({
    super.key,
    required this.hintTextHere,
    required this.obscure,
    required this.controller, // ✅ Make sure this is required
    required this.keyboardType,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: Colors.black,
        cursorErrorColor: Colors.red,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintTextHere,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: false,
        ),
      ),
    );
  }
}
