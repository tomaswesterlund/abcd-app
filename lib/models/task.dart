class Task {
  Task(
      {required this.type,
      required this.title,
      required this.description,
      required this.scheduledDate});

  final String type;
  final String title;
  final String description;
  final DateTime scheduledDate;
}
