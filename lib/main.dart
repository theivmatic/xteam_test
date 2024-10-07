import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xteam_test/src/core/observers/bloc_observer.dart';
import 'package:xteam_test/src/core/observers/route_observer.dart';
import 'package:xteam_test/src/core/routes/app_router.dart';
import 'package:xteam_test/src/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:xteam_test/src/feature/home/domain/bloc/home_bloc.dart';

void main() async {
  // Initialize
  WidgetsFlutterBinding.ensureInitialized();

  // Orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // BLoC
  Bloc.observer = AppBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter.instance();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        navigatorObservers: () => [RootRouteObserver()],
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(0.8)),
          child: child!,
        );
      },
    );
  }
}
