import 'package:abcd_app/imports.dart';

class TaskApi {
  List<Task> getTasks() {
    return [
      Task(
        type: 'A',
        title: 'My first task',
        description: 'This is my descrition of my first task ...',
      ),
      Task(
        type: 'A',
        title: 'My second task',
        description: 'Second task woho!',
      ),
      Task(
        type: 'B',
        title: 'My B1',
        description: 'This is my descrition of my first task ...',
      ),
      Task(
        type: 'B',
        title: 'My B2',
        description: 'Second task woho!',
      ),
      Task(
        type: 'C',
        title: 'My C1',
        description: 'This is my descrition of my first task ...',
      ),
      Task(
        type: 'C',
        title: 'My C2',
        description: 'Second task woho!',
      ),
    ];
  }
}
