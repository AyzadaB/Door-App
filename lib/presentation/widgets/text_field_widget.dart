import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: title,
        hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
