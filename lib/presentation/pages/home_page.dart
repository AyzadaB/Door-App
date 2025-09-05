import 'package:door_app/presentation/pages/log_in_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LogInPage()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Text(
          "Кош келдин!",
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
    );
  }
}
