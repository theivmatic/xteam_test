part of 'auth_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class SignInClickedEvent extends AuthBlocEvent {
  final String login;
  final String password;

  SignInClickedEvent({
    required this.login,
    required this.password,
  });
}
