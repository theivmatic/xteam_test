import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:xteam_test/src/feature/auth/presentation/widgets/form.dart';
import 'package:xteam_test/src/feature/auth/presentation/widgets/primary_button.dart';

@RoutePage()
class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController loginController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Авторизация'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(),
            FormWidget(controller: loginController),
            const SizedBox(height: 10),
            FormWidget(controller: passwordController),
            const Spacer(),
            PrimaryButtonWidget(
              text: 'Войти',
              onPressed: () {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
