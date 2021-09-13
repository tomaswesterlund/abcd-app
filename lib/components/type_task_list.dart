import 'package:abcd_app/imports.dart';

class TypeTaskList extends StatelessWidget {
  TypeTaskList({required this.type, required this.tasks});

  final String type;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          HorizontalOrLine(height: 10, label: type),
          ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Expanded(
                        child:
                            Text('{$type${index + 1}} ${tasks[index].title}'),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
