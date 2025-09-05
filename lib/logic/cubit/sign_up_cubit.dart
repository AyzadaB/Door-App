import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../core/utils/validation_helper.dart';
import '../../data/models/user_model.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUp({
    required String firstName,
    required String lastName,
    required String phone,
    required String login,
    required String password,
    required String confirmPassword,
  }) async {
    if (!ValidationHelper.validateCyrillic(firstName)) {
      emit(
        SignUpError(
          "Аты туура эмес. Кирилл тамгалары менен жана кеминде 3 тамга болушу керек.",
        ),
      );
      return;
    }
    if (!ValidationHelper.validateCyrillic(lastName)) {
      emit(
        SignUpError(
          "Фамилия туура эмес. Кирилл тамгалары менен жана кеминде 3 тамга болушу керек.",
        ),
      );
      return;
    }
    if (!ValidationHelper.validatePhone(phone)) {
      emit(SignUpError("Телефон туура эмес. +996 менен башталышы керек."));
      return;
    }
    if (!ValidationHelper.validateLogin(login)) {
      emit(
        SignUpError(
          "Логин туура эмес. Латын тамгалары менен, кичинекей жана кеминде 3 тамга болушу керек.",
        ),
      );
      return;
    }
    if (!ValidationHelper.validatePassword(password)) {
      emit(SignUpError("Сыр сөз туура эмес: кеминде 8 символ болушу керек."));
      return;
    }
    if (password != confirmPassword) {
      emit(SignUpError("Сыр сөздөр дал келбеди."));
      return;
    }

    emit(SignUpLoading());

    try {
      var box = Hive.box<UserModel>('users');
      final user = UserModel(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        login: login,
        password: password,
      );
      await box.add(user);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpError("Ката болду: $e"));
    }
  }
}
