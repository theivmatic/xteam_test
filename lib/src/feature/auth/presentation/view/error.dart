import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:xteam_test/src/core/localization/localization.dart';
import 'package:xteam_test/src/core/routes/app_router.dart';
import 'package:xteam_test/src/core/routes/app_router.gr.dart';

AppRouter router = AppRouter.instance();

@RoutePage()
class AuthErrorView extends StatelessWidget {
  const AuthErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await Future.delayed(
              const Duration(seconds: 1),
              () => router.pushAndPopUntil(
                const AuthView(),
                predicate: (_) => false,
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Center(
        child: Text(L.wrongLoginOrPassword),
      ),
    );
  }
}
