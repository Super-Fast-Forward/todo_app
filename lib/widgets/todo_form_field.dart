import 'package:flutter/material.dart';

class TodoFromField extends StatelessWidget {
  const TodoFromField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintText: "Type a task",
                fillColor: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: Container(
            height: 49,
            width: 49,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).hintColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: Theme.of(context).cardColor,
            ),
            child: Icon(
              Icons.add,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ],
    );
  }
}
