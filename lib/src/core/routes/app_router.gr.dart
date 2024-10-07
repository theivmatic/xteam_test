// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:xteam_test/src/feature/auth/presentation/view/auth.dart' as _i1;
import 'package:xteam_test/src/feature/home/presentation/view/home.dart' as _i2;

/// generated route for
/// [_i1.AuthView]
class AuthView extends _i3.PageRouteInfo<void> {
  const AuthView({List<_i3.PageRouteInfo>? children})
      : super(
          AuthView.name,
          initialChildren: children,
        );

  static const String name = 'AuthView';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthView();
    },
  );
}

/// generated route for
/// [_i2.HomeView]
class HomeView extends _i3.PageRouteInfo<void> {
  const HomeView({List<_i3.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeView();
    },
  );
}
