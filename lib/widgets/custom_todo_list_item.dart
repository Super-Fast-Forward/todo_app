import 'package:flutter/material.dart';

class CustomTodoListItem extends StatelessWidget {
  const CustomTodoListItem({
    super.key,
    this.isDone = false,
    required this.text,
    required this.onCrossTap,
    required this.onTextTap,
  });

  final bool isDone;
  final String text;
  final void Function()? onTextTap;
  final void Function()? onCrossTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).hintColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTextTap,
            child: Text(
              text,
              style: isDone
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
          ),
          GestureDetector(
            onTap: onCrossTap,
            child: Icon(
              Icons.close,
              color: Theme.of(context).hintColor,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
