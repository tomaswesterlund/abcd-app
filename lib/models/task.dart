import 'package:abcd_app/imports.dart';

class Task {
  Task(
      {required this.type,
      required this.title,
      required this.description,
      required this.scheduledDate});

  final String type;
  final String title;
  final String description;
  final Timestamp scheduledDate;

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'description': description,
        'scheduledDate': scheduledDate,
      };
}
