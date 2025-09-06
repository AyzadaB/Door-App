import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (event.login.isEmpty || event.password.isEmpty) {
      emit(LoginError("Логин жана сыр сөз толтурулушу керек"));
      return;
    }

    emit(LoginLoading());

    try {
      final users = repository
          .getAllUsers(); // Hive түз эмес, repository аркылуу
      UserModel? user;

      for (var u in users) {
        if (u.login == event.login && u.password == event.password) {
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
