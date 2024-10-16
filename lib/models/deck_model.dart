class DeckModel {
  final String deckId;
  bool shuffled;
  int remaining;

  DeckModel({
    required this.deckId,
    required this.shuffled,
    required this.remaining,
  });

  factory DeckModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'deckId': String deckId,
        'shuffled': bool shuffled,
        'remaining': int remaining,
      } =>
        DeckModel(
          deckId: deckId,
          shuffled: shuffled,
          remaining: remaining,
        ),
      _ => throw const FormatException('Failed to load deck.'),
    };
  }
}
