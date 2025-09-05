import 'package:door_app/presentation/pages/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Регистрируем адаптер
  Hive.registerAdapter(UserModelAdapter());

  // Открываем коробку пользователей
  await Hive.openBox<UserModel>('users');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LogInPage());
  }
}
