class ValidationHelper {
  /// Имя/фамилия: только кириллица, минимум 3 буквы
  static bool validateCyrillic(String value) {
    final regex = RegExp(r'^[А-Яа-яЁё]{3,}$');
    return regex.hasMatch(value);
  }

  /// Телефон: начинается с +996 и содержит ещё 9 цифр
  static bool validatePhone(String phone) {
    final regex = RegExp(r'^\+996\d{9}$');
    return regex.hasMatch(phone);
  }

  /// Логин: латиница, только строчные буквы, минимум 3 символа
  static bool validateLogin(String login) {
    final regex = RegExp(r'^[a-z]{3,}$');
    return regex.hasMatch(login);
  }

  /// Пароль: минимум 8 символов
  static bool validatePassword(String password) {
    return password.length >= 8;
  }
}
