import 'package:abcd_app/imports.dart';

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
    // print('Building ...');
    // var tasks = await TaskApi().getByDate(date: selectedDate);
    // var currentTask = tasks.firstOrNull;

    return FutureBuilder<List<Task>>(
        future: TaskApi().getByDate(date: selectedDate),
        builder: (context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasData) {
            var tasks = snapshot.data!;
            var currentTask = tasks.firstOrNull;

            return SafeArea(
              child: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CurrentTask(task: currentTask, date: selectedDate),
                      Expanded(child: TaskList(tasks: tasks)),
                      DatePicker(onDateClicked: onDateClicked),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Text("Loading ...");
            //CircularProgressIndicator();
          }
        });

    // ,)(
  }
}
