import 'package:my_first_flutter_app/models/card_model.dart';
import 'package:my_first_flutter_app/models/deck_model.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

class InternalDeckService {

  // Method to start a new deck of cards
  DeckModel startNewDeck() {
    const suits = ["spades", "diamonds", "clubs", "hearts"];
    const values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"];

    List<CardModel> cards = [];
    var uuid = Uuid();
    var deckId = uuid.v4();
    DeckModel deck = DeckModel(deckId: deckId, shuffled: false, remaining: 52, cards: cards);

    for (var i = 0; i < suits.length; i++) {
      for (var x = 0; x < values.length; x++) {
        CardModel card = CardModel(
            suit: suits[i],
            value: values[x],
            code: "${values[x]}_${suits[i]}");
        cards.insert(cards.length, card);
      }
    }
    deck.cards = cards;
    // Shuffle before return
    deck = _shuffle(deck);
    // Return a deck with all cards shuffled
    return deck;
  }

  // Method to shuffle a deck
  DeckModel _shuffle(deck) {
    for (var i = 0; i < 1000; i++) {
      var location1 = (Random().nextDouble() * deck.cards.length).floor();
      var location2 = (Random().nextDouble() * deck.cards.length).floor();
      var tmp = deck.cards[location1];

      deck.cards[location1] = deck.cards[location2];
      deck.cards[location2] = tmp;
    }
    deck.shuffled = true;
    return deck;
  }
}
