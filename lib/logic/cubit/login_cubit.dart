import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../data/models/user_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({required String login, required String password}) async {
    if (login.isEmpty || password.isEmpty) {
      emit(LoginError("Логин жана сыр сөз толтурулушу керек"));
      return;
    }

    emit(LoginLoading());

    try {
      var box = Hive.box<UserModel>('users');

      // Ищем пользователя с таким логином
      UserModel? user;
      for (var u in box.values) {
        if (u.login == login && u.password == password) {
          user = u;
          break;
        }
      }

      if (user != null) {
        emit(LoginSuccess(user));
      } else {
        emit(LoginError("Логин же сыр сөз туура эмес"));
      }
    } catch (e) {
      emit(LoginError("Ката болду: $e"));
    }
  }
}
