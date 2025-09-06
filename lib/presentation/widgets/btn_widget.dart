import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: const Color.fromARGB(255, 16, 134, 231),
      ),
      child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
