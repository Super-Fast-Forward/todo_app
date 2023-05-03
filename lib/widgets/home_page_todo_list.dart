import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/firestore.dart';
import 'package:todo_app/main.dart';

import 'custom_todo_list_item.dart';

class HomePageTodoList extends ConsumerWidget {
  const HomePageTodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(colSP(COLLECTION_NAME)).when(
      data: (col) {
        if (col.size == 0) return const SizedBox.shrink();
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: col.size,
          itemBuilder: (context, index) {
            final todo = col.docs[index].data();
            return CustomTodoListItem(
              text: todo["text"],
              isDone: todo["isDone"],
              onCrossTap: () {},
              onTextTap: () {},
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
        );
      },
      error: (err, stack) {
        return const SizedBox.shrink();
      },
      loading: () {
        return const SizedBox.shrink(
          child: Text("Loading"),
        );
      },
    );
  }
}
