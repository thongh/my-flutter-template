import 'dart:convert';

import 'package:my_first_flutter_app/models/deck_model.dart';
import 'package:my_first_flutter_app/services/api_service.dart';

class ExternalDeckService extends ApiService {

  Future<DeckModel> startNewDeck([int deckCount = 1]) async {
    final response = await httpGet(
      '/deck/new/shuffle',
      params: {'deck_count': deckCount},
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return DeckModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load deck of cards');
    }
  }
}
