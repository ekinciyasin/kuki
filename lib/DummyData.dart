import 'package:kuki/models/CardMoldel.dart';
import 'package:kuki/models/Deck.dart';

class DummyData {
  static List<Deck> decks = [
    Deck(
      'Math Deck',
      cards: [
        CardModel(front: '2 + 2', back: '4'),
        CardModel(front: '5 * 5', back: '25'),
        // Diğer matematik kartları eklenebilir
      ],
    ),
    Deck(
      'History Deck',
      cards: [
        CardModel(front: 'Who wrote Hamlet?', back: 'William Shakespeare'),
        CardModel(front: 'In which year did World War I end?', back: '1918'),
        // Diğer tarih kartları eklenebilir
      ],
    ),
    // Diğer desteler eklenebilir
  ];
}
