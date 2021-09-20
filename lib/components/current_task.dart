import 'package:abcd_app/imports.dart';

class CurrentTask extends StatelessWidget {
  CurrentTask({required this.task});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    if (task == null) {
      return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 8), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Text('No current task, great job!'),
          ],
        ),
      );
    } else {
      var task = this.task!;

      return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 8), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Text('Current task: ${task.title}'),
            Text('Description: ${task.description}'),
            Text('My sub-task 1'),
            Text('My sub-task 2'),
            Text('My sub-task 3'),
          ],
        ),
      );
    }
  }
}
