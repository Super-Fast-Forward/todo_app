import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_todo_list_item.dart';
import 'package:todo_app/widgets/home_page_todo_list.dart';
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
          children: const [
            TodoFromField(),
            SizedBox(height: 20),
            HomePageTodoList(),
          ],
        ),
      ),
    );
  }
}
