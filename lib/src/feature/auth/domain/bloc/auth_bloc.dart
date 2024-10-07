import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xteam_test/src/core/routes/app_router.dart';
import 'package:xteam_test/src/core/routes/app_router.gr.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(AuthBlocInitialState()) {
    on<AuthBlocEvent>((event, emit) => switch (event) {
          SignInClickedEvent() => _signInClicked(event, emit),
        });
  }
  AppRouter router = AppRouter.instance();

  FutureOr<void> _signInClicked(
    SignInClickedEvent event,
    Emitter<AuthBlocState> emit,
  ) async {
    const String correctLogin = 'test';
    const String correctPassword = 'password';

    if (event.login == correctLogin && event.password == correctPassword) {
      try {
        emit(AuthBlocUserEnteredState());
        await Future.delayed(
          const Duration(seconds: 1),
          () => router.pushAndPopUntil(
            const HomeView(),
            predicate: (_) => false,
          ),
        );
      } on Exception {
        emit(
          AuthBlocErrorState(errorMessage: 'Логин или пароль введен неверно'),
        );
      }
    }
  }
}
