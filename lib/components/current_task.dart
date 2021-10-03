import 'package:abcd_app/imports.dart';

class CurrentTask extends StatefulWidget {
  CurrentTask({required this.task, required this.date});

  final Task? task;
  final DateTime date;

  @override
  _CurrentTaskState createState() => _CurrentTaskState();
}

class _CurrentTaskState extends State<CurrentTask> {
  @override
  Widget build(BuildContext context) {
    if (widget.task == null) {
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
            Text('Date: ${widget.date.toString().substring(0, 10)}'),
            Text('No current task, great job!'),
          ],
        ),
      );
    } else {
      var task = this.widget.task!;

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
        child: Row(
          children: [
            Text('Current task: ${task.title}'),
            Expanded(child: Container()),
            GestureDetector(
              child: Icon(Icons.center_focus_weak_outlined),
              onTap: () {
                // Change the color of the container beneath
                setState(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FocusedModeScreen(
                          task: task,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    }
  }
}
