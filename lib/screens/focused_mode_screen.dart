import 'package:abcd_app/imports.dart';

class FocusedModeScreen extends StatefulWidget {
  FocusedModeScreen({required this.task});

  final Task task;

  @override
  _FocusedModeScreenState createState() => _FocusedModeScreenState();
}

class _FocusedModeScreenState extends State<FocusedModeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  'You should be working on: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.center_focus_weak_outlined,
                    size: 96.0,
                    color: Colors.grey[800],
                  ),
                  Text(
                    '${widget.task.title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  '${widget.task.description}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              // Text(
              //   'Sub-task 1',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 18.0,
              //   ),
              // ),
              // Text(
              //   'Sub-task 2',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 18.0,
              //   ),
              // ),
              // Text(
              //   'Sub-task 3',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 18.0,
              //   ),
              // ),
              Expanded(
                child: Container(),
              ),
              OutlinedButton(
                child: Text('Start Pomodoro timer'),
                onPressed: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
