import 'package:flutter/material.dart';


class TextFieldAll extends StatelessWidget {
   final String title;
   final bool isObscure;
   final IconData? icon;
   final TextEditingController controller;


  TextFieldAll({ required this.title, required this.isObscure, required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(30),
        suffixIcon: Icon(icon),
        hintText: title,
        fillColor: Colors.transparent,
        border:OutlineInputBorder(
          borderRadius:  BorderRadius.circular(30),
        ),
        ),
    );
  }
}
