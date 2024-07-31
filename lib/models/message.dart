class Message {
  final String? id;
  final String text;
  final String senderId;
  final String receiverId;
  final DateTime createdAt;
  final bool isRead;

  const Message({
    this.id,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.createdAt,
    this.isRead = false,
  });

  factory Message.fromMap(Map<String, dynamic> message, String id) {
    return Message(
      id: id,
      text: message['text'],
      senderId: message['senderId'],
      receiverId: message['receiverId'],
      createdAt: message['createdAt'],
      isRead: message['isRead'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'senderId': senderId,
      'receiverId': receiverId,
      'createdAt': createdAt,
      'isRead': isRead,
    };
  }
}
