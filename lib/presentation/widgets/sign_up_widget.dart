import 'package:door_app/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );
      },
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          color: const Color.fromARGB(255, 25, 175, 220),
          letterSpacing: -1.0,
        ),
      ),
    );
  }
}
