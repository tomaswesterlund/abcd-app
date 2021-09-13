import 'package:abcd_app/imports.dart';

class DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.amberAccent,
      child: Row(
        children: [
          Column(
            children: [
              Icon(Icons.home_outlined),
              Icon(Icons.arrow_left, size: 64.0),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Text('Mon'),
                      Text('28-Aug'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Text('Mon, 28/3'),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Icon(Icons.today_outlined),
              Icon(
                Icons.arrow_right,
                size: 64.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
