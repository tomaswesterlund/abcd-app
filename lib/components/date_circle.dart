import 'package:abcd_app/imports.dart';
import 'package:intl/intl.dart';

class DateCircle extends StatefulWidget {
  const DateCircle({required this.date, required this.onDateClicked});

  final DateTime date;
  final Function(DateTime) onDateClicked;

  @override
  _DateCircleState createState() => _DateCircleState();
}

class _DateCircleState extends State<DateCircle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        setState(
          () {
            print(widget.date);
            widget.onDateClicked(widget.date);
          },
        ),
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: getBoxDecoration(),
        child: Column(
          children: [
            Text(DateFormat('E').format(widget.date)),
            Text(DateFormat('MMMd').format(widget.date)),
          ],
        ),
      ),
    );
  }

  BoxDecoration getBoxDecoration() {
    var color = Colors.black;
    var difference = this.widget.date.difference(DateTime.now()).inDays;

    if (widget.date.isToday()) {
      color = Colors.green;
    } else if (widget.date.isBefore(DateTime.now())) {
      color = Colors.grey;
    } else {
      color = Colors.black;
    }

    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      border: Border.all(width: 2, color: color),
    );

    return boxDecoration;
  }
}
