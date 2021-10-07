import 'package:abcd_app/imports.dart';

class TaskList extends StatelessWidget {
  TaskList({required this.tasks});

  final List<Task> tasks;

  String typeValue = "";
  TextEditingController titleTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var aTasks = tasks.where((element) => element.type == 'A').toList();
    var bTasks = tasks.where((element) => element.type == 'B').toList();
    var cTasks = tasks.where((element) => element.type == 'C').toList();
    var dTasks = tasks.where((element) => element.type == 'D').toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropDown(
                        items: ["A", "B", "C", "D"],
                        hint: Text("Type"),
                        icon: Icon(
                          Icons.expand_more,
                          color: Colors.blue,
                        ),
                        onChanged: (newValue) {
                          typeValue = newValue.toString();
                        },
                      ),
                      TextField(
                        controller: titleTextController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                      ),
                      TextField(
                        controller: descriptionTextController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                        ),
                      ),

                      //                       {required this.type,
                      // required this.title,
                      // required this.description,
                      // required this.scheduledDate});

                      ElevatedButton(
                        child: const Text('Add task'),
                        onPressed: () async {
                          var task = Task(
                              type: typeValue,
                              title: titleTextController.value.toString(),
                              description:
                                  descriptionTextController.value.toString(),
                              scheduledDate: Timestamp.fromDate(
                                DateTime.now(),
                              ));

                          await TaskApi().add(task);

                          //Close
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            children: [
              TypeTaskList(type: 'A', tasks: aTasks),
              TypeTaskList(type: 'B', tasks: bTasks),
              TypeTaskList(type: 'C', tasks: cTasks),
              TypeTaskList(type: 'D', tasks: dTasks),
            ],
          ),
        ),
      ),
    );
  }
}
