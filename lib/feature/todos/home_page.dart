import 'package:todo_app/core/_core_export.dart';

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
