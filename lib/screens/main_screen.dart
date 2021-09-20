import 'package:abcd_app/components/current_task.dart';
import 'package:abcd_app/imports.dart';
import 'package:collection/collection.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime selectedDate = DateTime.now();

  void onDateClicked(DateTime value) {
    setState(() {
      print('Date clicked: $value');
      selectedDate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Building ...');
    var tasks = TaskApi().getTasks(date: selectedDate);
    var currentTask = tasks.firstOrNull;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CurrentTask(task: currentTask),
            Expanded(child: TaskList(tasks: tasks)),
            DatePicker(onDateClicked: onDateClicked),
          ],
        ),
      ),
    );
  }
}
