import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_todo_list_item.dart';
import 'package:todo_app/widgets/todo_form_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TodoFromField(),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return CustomTodoListItem(
                  text: "A",
                  onCrossTap: () {},
                  onTextTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
