import 'package:kuki/models/CardMoldel.dart';

class Deck {
  final String name;
  List<CardModel> cards;

  Deck(this.name, {List<CardModel>? cards}) : cards = cards ?? [];
}
