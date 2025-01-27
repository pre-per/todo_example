class History {
  String id;
  String content;
  DateTime date;

  History({
    required this.id,
    required this.content,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'date': date.toIso8601String(),
    };
  }

  factory History.fromMap(Map<String, dynamic> map, String documentId) {
    return History(
      id: documentId,
      content: map['content'] ?? '',
      date: DateTime.parse(map['date']),
    );
  }
}
