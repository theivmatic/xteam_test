import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xteam_test/src/core/localization/localization.dart';
import 'package:xteam_test/src/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:xteam_test/src/feature/auth/presentation/widgets/form.dart';
import 'package:xteam_test/src/feature/auth/presentation/widgets/primary_button.dart';

@RoutePage()
class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final AuthBloc authBloc;

  @override
  void initState() {
    super.initState();

    authBloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(L.auth),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) => switch (state) {
            AuthBlocInitialState() => Column(
                children: [
                  const Spacer(),
                  FormWidget(
                    controller: loginController,
                    labelText: L.login,
                  ),
                  const SizedBox(height: 10),
                  FormWidget(
                    controller: passwordController,
                    labelText: L.password,
                  ),
                  const Spacer(),
                  PrimaryButtonWidget(
                    text: L.signIn,
                    onPressed: () {
                      if (loginController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        authBloc.add(
                          SignInClickedEvent(
                            login: loginController.text,
                            password: passwordController.text,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(L.fillAllFields),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            AuthBlocLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            AuthBlocErrorState(errorMessage: L.somethingWentWrong) => Center(
                child: Text(state.errorMessage),
              ),
            (_) => const SizedBox(),
          },
        ),
      ),
    );
  }
}
