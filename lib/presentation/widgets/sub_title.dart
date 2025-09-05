import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({super.key, required this.subTitle});
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(fontSize: 17, color: Colors.grey, letterSpacing: -1.0),
    );
  }
}
