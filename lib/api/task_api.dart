import 'package:abcd_app/imports.dart';

class TaskApi {
  CollectionReference taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  Future add(Task task) async {
    var json = task.toJson();
    await taskCollection.add(json);
  }

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
