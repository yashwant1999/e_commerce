import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final IconData icon;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.obscureText = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration:
          InputDecoration(icon: Icon(widget.icon), hintText: widget.hintText),
      validator: ((value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter the value';
        }

        return null;
      }),
    );
  }
}
