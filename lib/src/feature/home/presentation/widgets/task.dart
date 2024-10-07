import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  final String title;
  final bool completed;

  const TaskWidget({
    super.key,
    required this.title,
    required this.completed,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    decoration: widget.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              const Spacer(),
              Checkbox(
                value: widget.completed == true ? true : false,
                onChanged: (value) {
                  value = !value!;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
