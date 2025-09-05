import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String login;

  @HiveField(4)
  String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.login,
    required this.password,
  });
}
