// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:xteam_test/src/feature/auth/presentation/view/auth.dart' as _i2;
import 'package:xteam_test/src/feature/auth/presentation/view/error.dart'
    as _i1;
import 'package:xteam_test/src/feature/home/presentation/view/home.dart' as _i3;

/// generated route for
/// [_i1.AuthErrorView]
class AuthErrorView extends _i4.PageRouteInfo<void> {
  const AuthErrorView({List<_i4.PageRouteInfo>? children})
      : super(
          AuthErrorView.name,
          initialChildren: children,
        );

  static const String name = 'AuthErrorView';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthErrorView();
    },
  );
}

/// generated route for
/// [_i2.AuthView]
class AuthView extends _i4.PageRouteInfo<void> {
  const AuthView({List<_i4.PageRouteInfo>? children})
      : super(
          AuthView.name,
          initialChildren: children,
        );

  static const String name = 'AuthView';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthView();
    },
  );
}

/// generated route for
/// [_i3.HomeView]
class HomeView extends _i4.PageRouteInfo<void> {
  const HomeView({List<_i4.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeView();
    },
  );
}
