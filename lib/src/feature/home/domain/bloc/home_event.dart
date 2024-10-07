part of 'home_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class FetchTasksEvent extends HomeBlocEvent {}
