import 'package:abcd_app/imports.dart';

class TaskApi {
  CollectionReference taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  // List<Task> tasks = [
  //   Task(
  //     type: 'A',
  //     title: 'My first task',
  //     description: 'This is my descrition of my first task ...',
  //     scheduledDate: DateTime.now(),
  //   ),
  //   Task(
  //     type: 'A',
  //     title: 'My second task',
  //     description: 'Second task woho!',
  //     scheduledDate: DateTime.now(),
  //   ),
  //   Task(
  //     type: 'B',
  //     title: 'My B1',
  //     description: 'This is my descrition of my first task ...',
  //     scheduledDate: DateTime.now(),
  //   ),
  //   Task(
  //     type: 'B',
  //     title: 'My B2',
  //     description: 'Second task woho!',
  //     scheduledDate: DateTime.now(),
  //   ),
  //   Task(
  //     type: 'C',
  //     title: 'My C1',
  //     description: 'This is my descrition of my first task ...',
  //     scheduledDate: DateTime.now(),
  //   ),
  //   Task(
  //     type: 'C',
  //     title: 'My C2',
  //     description: 'Second task woho!',
  //     scheduledDate: DateTime.now(),
  //   ),
  //   Task(
  //     type: 'A',
  //     title: 'My first task',
  //     description: 'This is my descrition of my first task ...',
  //     scheduledDate: DateTime.now().add(
  //       Duration(days: 1),
  //     ),
  //   ),
  //   Task(
  //     type: 'A',
  //     title: 'My second task',
  //     description: 'Second task woho!',
  //     scheduledDate: DateTime.now().add(
  //       Duration(days: 1),
  //     ),
  //   ),
  //   Task(
  //     type: 'B',
  //     title: 'My B1',
  //     description: 'This is my descrition of my first task ...',
  //     scheduledDate: DateTime.now().add(
  //       Duration(days: 1),
  //     ),
  //   ),
  //   Task(
  //     type: 'B',
  //     title: 'My B2',
  //     description: 'Second task woho!',
  //     scheduledDate: DateTime.now().add(
  //       Duration(days: 1),
  //     ),
  //   ),
  //   Task(
  //     type: 'C',
  //     title: 'My C1',
  //     description: 'This is my descrition of my first task ...',
  //     scheduledDate: DateTime.now().add(
  //       Duration(days: 1),
  //     ),
  //   ),
  //   Task(
  //     type: 'C',
  //     title: 'My C2',
  //     description: 'Second task woho!',
  //     scheduledDate: DateTime.now().add(
  //       Duration(days: 1),
  //     ),
  //   ),
  // ];

  Future<List<Task>> getAll() async {
    var tasks = <Task>[];
    var querySnapshot = await taskCollection.get();

    for (var doc in querySnapshot.docs) {
      var task = Task(
        type: doc["type"],
        title: doc["title"],
        description: doc["description"],
        scheduledDate: doc["scheduledDate"],
      );

      tasks.add(task);
    }

    return tasks;
  }

  Future<List<Task>> getByDate({date: DateTime}) async {
    var tasks = await getAll();

    return tasks
        .where((element) => element.scheduledDate.toDate().isTheSameDay(date))
        .toList();
  }
}
