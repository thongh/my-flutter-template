enum Suit {
  hearts,
  clubs,
  diamonds,
  spades,
}

class CardModel {
  final String image;
  final String suit;
  final String value;
  final String code;

  CardModel({
    required this.image,
    required this.suit,
    required this.value,
    required this.code
  });
}
