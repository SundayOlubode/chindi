class Notification {
  final String title;
  final String content;
  final DateTime createdAt;

  const Notification({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory Notification.fromMap(Map<String, dynamic> notification) {
    return Notification(
      title: notification['title'],
      content: notification['content'],
      createdAt: DateTime.parse(notification['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
