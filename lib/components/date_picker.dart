import 'package:abcd_app/imports.dart';

class DatePicker extends StatefulWidget {
  DatePicker({required this.onDateClicked});

  final Function(DateTime) onDateClicked;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  bool showCalendar = false;
  DateTime focusedDay = DateTime.now();

  void setDate(DateTime date) {
    showCalendar = false;
    focusedDay = date;
    widget.onDateClicked(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0.0),
        color: Colors.amberAccent,
        child: Column(
          children: [
            if (showCalendar)
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: focusedDay,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    setDate(focusedDay);
                  });
                },
              ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Icon(Icons.home_outlined),
                        onTap: () {
                          setState(
                            () {
                              setDate(focusedDay);
                            },
                          );
                        },
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        child: Icon(Icons.today_outlined),
                        onTap: () {
                          // Change the color of the container beneath
                          setState(
                            () {
                              setDate(DateTime.now());
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
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
              ],
            ),
          ],
        ));
  }
}
