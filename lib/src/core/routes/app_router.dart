import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  static final AppRouter _router = AppRouter._();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthView.page,
          initial: true,
        ),
        AutoRoute(page: HomeView.page),
      ];
  AppRouter._();

  /// Singleton instance of [AppRouter]
  factory AppRouter.instance() => _router;
}
