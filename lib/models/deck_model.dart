import 'package:my_first_flutter_app/models/card_model.dart';

class DeckModel {
  final String deckId;
  bool shuffled;
  int remaining;
  List<CardModel> cards;

  DeckModel({
    required this.deckId,
    required this.shuffled,
    required this.remaining,
    required this.cards
  });

  factory DeckModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'deckId': String deckId,
        'shuffled': bool shuffled,
        'remaining': int remaining,
        'cards': List<CardModel> cards,
      } =>
        DeckModel(
          deckId: deckId,
          shuffled: shuffled,
          remaining: remaining,
          cards: cards,
        ),
      _ => throw const FormatException('Failed to load deck.'),
    };
  }
}
