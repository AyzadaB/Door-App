import 'package:hive/hive.dart';
import '../../data/models/user_model.dart';

class UserRepository {
  final Box<UserModel> userBox;

  UserRepository(this.userBox);

  Future<void> addUser(UserModel user) async {
    await userBox.add(user);
  }

  List<UserModel> getAllUsers() {
    return userBox.values.toList();
  }
}
