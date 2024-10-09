import 'package:flutter/material.dart';
import 'package:xteam_test/src/core/localization/localization.dart';
import 'package:xteam_test/src/feature/auth/presentation/widgets/primary_button.dart';

class DialogsDisplayer {
  static void showAddToDoDialog(
    BuildContext context,
    TextEditingController controller,
    VoidCallback onPressed,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Text(L.enterTaskTitle),
                const SizedBox(height: 20),
                TextField(
                  controller: controller,
                ),
                const SizedBox(height: 20),
                PrimaryButtonWidget(
                  text: L.add,
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
