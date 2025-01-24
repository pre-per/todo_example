class Task {
  String id;
  String title;
  DateTime date;
  String description;
  bool isChecked;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    this.isChecked = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'description': description,
      'isChecked': isChecked,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map, String documentId) {
    return Task(
      id: documentId,
      title: map['title'] ?? '',
      date: DateTime.parse(map['date']),
      description: map['description'] ?? '',
      isChecked: map['isChecked'] ?? false,
    );
  }
}
