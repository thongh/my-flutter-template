import 'package:my_first_flutter_app/models/card_model.dart';

class PlayerModel {
  final String name;
  final bool isHuman;
  List<CardModel> cards;

  PlayerModel({
    required this.name,
    this.isHuman = false,
    this.cards = const [],
  });
}
