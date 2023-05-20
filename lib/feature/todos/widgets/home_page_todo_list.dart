import 'package:todo_app/core/_core_export.dart';

class HomePageTodoList extends ConsumerWidget {
  const HomePageTodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(colSP(COLLECTION_REFERENCE.path)).when(
      data: (col) {
        if (col.size == 0) return const SizedBox.shrink();
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: col.size,
          itemBuilder: (context, index) {
            final todo = col.docs[index];
            return CustomTodoListItem(
              text: todo["text"],
              isDone: todo["isDone"],
              onCrossTap: () {
                todo.reference.delete();
              },
              onTextTap: () {
                todo.reference.update({"isDone": !todo["isDone"]});
              },
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
        return const Padding(
          padding: EdgeInsets.only(top: 100),
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
