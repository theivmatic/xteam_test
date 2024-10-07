part of 'auth_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitialState extends AuthBlocState {}

final class AuthBlocLoadingState extends AuthBlocState {}

final class AuthBlocUserEnteredState extends AuthBlocState {}

final class AuthBlocErrorState extends AuthBlocState {
  final String errorMessage;

  AuthBlocErrorState({required this.errorMessage});
}
