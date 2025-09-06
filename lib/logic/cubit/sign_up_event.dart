abstract class SignUpEvent {}

class SignUpSubmitted extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String phone;
  final String login;
  final String password;
  final String confirmPassword;

  SignUpSubmitted({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.login,
    required this.password,
    required this.confirmPassword,
  });
}
