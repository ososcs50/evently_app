import 'package:flutter/material.dart';

// ignore: must_be_immutable
class C_TextFormFild extends StatelessWidget {
  String? Function(String?) validator;
  final TextEditingController con;
  bool obscureText;
  final String title;
  Widget? suffix;
  Widget? prefix;

  C_TextFormFild({
    super.key,
    required this.title,
    required this.con,
    this.suffix,
    this.prefix,
    this.obscureText = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20),
      validator: validator,
      controller: con,
      obscureText: obscureText,
      cursorColor: Colors.black54,
      cursorHeight: 25,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelText: title,
      ),
    );
  }
}
