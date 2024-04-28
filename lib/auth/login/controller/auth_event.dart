abstract class AuthEvent {}

class LoginSubmitted extends AuthEvent {
  final String mobileNumber;
  final String password;

  LoginSubmitted({required this.mobileNumber, required this.password});
}
