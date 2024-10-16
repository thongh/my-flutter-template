import 'package:my_first_flutter_app/models/deck_model.dart';
import 'package:my_first_flutter_app/services/internal_deck_service.dart';
import 'package:test/test.dart';

void main() {
  test('Test - create a new deck of cards', () {
    final internalDeckService = InternalDeckService();

    DeckModel deck = internalDeckService.startNewDeck();

    expect(deck.deckId, isNotNull);
    expect(deck.cards.length, 52);
    expect(deck.shuffled, true);
  });
}