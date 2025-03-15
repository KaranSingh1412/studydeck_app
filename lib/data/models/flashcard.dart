class Flashcard {
  final int id;
  final int userId;
  final int setId;
  String front;
  String back;
  final int timestamp;
  final int? icon;

  Flashcard(
      {required this.id,
      required this.userId,
      required this.setId,
      required this.front,
      required this.back,
      required this.timestamp,
      this.icon});

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      id: json['id'],
      userId: json['user_id'],
      setId: json['set_id'],
      front: json['front'],
      back: json['back'],
      timestamp: json['timestamp'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'set_id': setId,
      'front': front,
      'back': back,
    };
  }
}
