enum Suit {
  hearts,
  clubs,
  diamonds,
  spades,
}

class CardModel {
  final String suit;
  final String value;
  final String code;

  CardModel({
    required this.suit,
    required this.value,
    required this.code
  });
}
