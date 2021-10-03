import 'package:abcd_app/imports.dart';

class TypeTaskList extends StatefulWidget {
  TypeTaskList({required this.type, required this.tasks});

  final String type;
  final List<Task> tasks;

  @override
  _TypeTaskListState createState() => _TypeTaskListState();
}

class _TypeTaskListState extends State<TypeTaskList> {
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
          HorizontalOrLine(height: 10, label: widget.type),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: null),
                    Expanded(
                      child: Text(
                          '{${widget.type}${index + 1}} ${widget.tasks[index].title}'),
                    ),
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
                                  task: widget.tasks[index],
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
            },
          ),
        ],
      ),
    );
  }
}
