import 'package:studydeck_app/data/models/flashcard.dart';

class FlashcardSet {
  final int? id;
  final String? title;
  final String? description;
  final List<Flashcard>? flashcards;
  final int? timestamp;

  FlashcardSet({
    required this.id,
    required this.title,
    required this.description,
    required this.flashcards,
    required this.timestamp,
  });

  factory FlashcardSet.fromJson(Map<String, dynamic> json) {
    return FlashcardSet(
      id: json['id'],
      title: json['name'],
      description: json['description'],
      flashcards: json['cards'] != null
          ? [for (var card in json['cards']) Flashcard.fromJson(card)]
          : [],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': title,
      'description': description,
    };
  }
}
