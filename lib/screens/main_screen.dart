import 'package:abcd_app/components/current_task.dart';
import 'package:abcd_app/imports.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var tasks = TaskApi().getTasks();
    var currentTask = tasks[0];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CurrentTask(task: currentTask),
            Expanded(
              child: TaskList(tasks: tasks),
            ),
            DatePicker(),
          ],
        ),
      ),
    );
  }
}
