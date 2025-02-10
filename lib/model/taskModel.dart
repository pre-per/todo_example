class Task {
  String id;
  String title;
  DateTime date;
  String category;
  bool isChecked;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.category,
    this.isChecked = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'isChecked': isChecked,
      'category': category,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map, String documentId) {
    return Task(
      id: documentId,
      title: map['title'] ?? 'Untitled',
      date: DateTime.parse(map['date']),
      isChecked: map['isChecked'] ?? false,
      category: map['category'] ?? 'no category',
    );
  }
}
