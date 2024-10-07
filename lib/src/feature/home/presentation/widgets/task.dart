import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final bool completed;

  const TaskWidget({
    super.key,
    required this.title,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(height: 20),
              Text('Completed: $completed'),
            ],
          ),
        ),
      ),
    );
  }
}
