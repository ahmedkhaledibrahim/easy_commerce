part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List get props => [];
}

class SignUpEvent extends AuthEvent {
  final Customer customer;

  const SignUpEvent({required this.customer});

  @override
  List get props => [];
}

class LoginEvent extends AuthEvent {
  final UserModel user;

  const LoginEvent({required this.user});

  @override
  List get props => [];
}

class LogoutEvent extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}