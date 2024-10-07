import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController controller;

  const FormWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
    );
  }
}
