import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<Object?> bloc) {
    super.onCreate(bloc);
    log('\x1B[38;2;255;165;0mCreated $bloc');
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    super.onEvent(bloc, event);
    log('\x1B[38;2;255;165;0mEvent in $bloc: $event');
  }

  @override
  void onChange(BlocBase<Object?> bloc, Change<Object?> change) {
    super.onChange(bloc, change);
    log('\x1B[38;2;255;165;0mChanged state in $bloc from ${change.currentState} to ${change.nextState}');
  }

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log('\x1B[38;2;255;165;0mTransition in $bloc : ${transition.currentState} -> ${transition.nextState}');
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    super.onClose(bloc);
    log('\x1B[38;2;255;165;0mClosed $bloc');
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('\x1B[38;2;255;165;0mError in $bloc: $error\nStacktrace: $stackTrace');
  }
}
