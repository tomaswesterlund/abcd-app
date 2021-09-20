import 'package:abcd_app/imports.dart';

class TaskList extends StatelessWidget {
  TaskList({required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    var aTasks = tasks.where((element) => element.type == 'A').toList();
    var bTasks = tasks.where((element) => element.type == 'B').toList();
    var cTasks = tasks.where((element) => element.type == 'C').toList();
    var dTasks = tasks.where((element) => element.type == 'D').toList();

    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            TypeTaskList(type: 'A', tasks: aTasks),
            TypeTaskList(type: 'B', tasks: bTasks),
            TypeTaskList(type: 'C', tasks: cTasks),
            TypeTaskList(type: 'D', tasks: dTasks),
          ],
        ),
      ),
    );
  }
}
