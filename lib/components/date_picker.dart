import 'package:abcd_app/imports.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  DatePicker({required this.onDateClicked});

  final Function(DateTime) onDateClicked;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  bool showCalendar = false;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.amberAccent,
        child: Column(
          children: [
            if (showCalendar)
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: focusedDay,
              ),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.home_outlined),
                      onTap: () {
                        setState(
                          () {
                            focusedDay = DateTime.now();
                          },
                        );
                      },
                    ),
                    Icon(Icons.arrow_left, size: 64.0),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DateCircle(
                          date: DateTime.now().add(Duration(days: -2)),
                          onDateClicked: widget.onDateClicked,
                        ),
                        DateCircle(
                          date: DateTime.now().add(Duration(days: -1)),
                          onDateClicked: widget.onDateClicked,
                        ),
                        DateCircle(
                          date: DateTime.now(),
                          onDateClicked: widget.onDateClicked,
                        ),
                        DateCircle(
                          date: DateTime.now().add(Duration(days: 1)),
                          onDateClicked: widget.onDateClicked,
                        ),
                        DateCircle(
                          date: DateTime.now().add(Duration(days: 2)),
                          onDateClicked: widget.onDateClicked,
                        ),
                        DateCircle(
                          date: DateTime.now().add(Duration(days: 3)),
                          onDateClicked: widget.onDateClicked,
                        ),
                        DateCircle(
                          date: DateTime.now().add(Duration(days: 4)),
                          onDateClicked: widget.onDateClicked,
                        ),
                        DateCircle(
                          date: DateTime.now().add(Duration(days: 5)),
                          onDateClicked: widget.onDateClicked,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.today_outlined),
                      onTap: () {
                        // Change the color of the container beneath
                        setState(
                          () {
                            print('Changing ...');
                            showCalendar = !showCalendar;
                            focusedDay = DateTime(2017, 9, 7, 17, 30);
                            //!showCalendar;
                          },
                        );
                      },
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 64.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
