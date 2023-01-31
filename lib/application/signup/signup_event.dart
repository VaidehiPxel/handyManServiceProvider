abstract class SignupEvent {
  const SignupEvent();

  List<Object> get props => [];
}

class SignupCallApiEvent extends SignupEvent {
  final String firstName;
  final String lastName;
  final String mobileNo;
  final String email;
  final String password;
  final String confirmPassword;
  const SignupCallApiEvent(
      {
        required this.firstName,
        required this.lastName,
        required this.mobileNo,
        required this.email,
        required this.password,
        required this.confirmPassword});

  @override
  List<Object> get props => [
    mobileNo.toString(),
    email.toString(),
    password.toString(),
    confirmPassword.toString()
  ];
}