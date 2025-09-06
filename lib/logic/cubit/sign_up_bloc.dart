import 'package:door_app/logic/sign_up_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/validation_helper.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository repository;

  SignUpBloc(this.repository) : super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    // ✅ Валидация
    if (!ValidationHelper.validateCyrillic(event.firstName)) {
      emit(SignUpError("Аты туура эмес."));
      return;
    }
    if (!ValidationHelper.validateCyrillic(event.lastName)) {
      emit(SignUpError("Фамилия туура эмес."));
      return;
    }
    if (!ValidationHelper.validatePhone(event.phone)) {
      emit(SignUpError("Телефон туура эмес."));
      return;
    }
    if (!ValidationHelper.validateLogin(event.login)) {
      emit(SignUpError("Логин туура эмес."));
      return;
    }
    if (!ValidationHelper.validatePassword(event.password)) {
      emit(SignUpError("Сыр сөз туура эмес."));
      return;
    }
    if (event.password != event.confirmPassword) {
      emit(SignUpError("Сыр сөздөр дал келбеди."));
      return;
    }

    emit(SignUpLoading());

    try {
      final user = UserModel(
        firstName: event.firstName,
        lastName: event.lastName,
        phone: event.phone,
        login: event.login,
        password: event.password,
      );

      await repository.addUser(user);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpError("Ката болду: $e"));
    }
  }
}
