import 'package:my_first_flutter_app/models/card_model.dart';

class DrawModel {
  final int remaining;
  final List<CardModel> cards;

  DrawModel({
    required this.remaining,
    this.cards = const [],
  });
}