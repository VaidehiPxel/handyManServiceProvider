import 'package:equatable/equatable.dart';

abstract class HelpEvent extends Equatable {
  const HelpEvent();

  @override
  List<Object> get props => [];
}

class HelpSubmitCallApiEvent extends HelpEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String message;

  const HelpSubmitCallApiEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.message,
      required this.mobile});

  @override
  List<Object> get props => [firstName, lastName, email,message,mobile];
}
