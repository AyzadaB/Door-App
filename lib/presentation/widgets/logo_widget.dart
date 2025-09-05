import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      shape: CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Icon(Icons.school, color: Colors.white, size: 60),
      ),
    );
  }
}
