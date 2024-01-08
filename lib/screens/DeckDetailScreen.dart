import 'package:flutter/material.dart';
import 'package:kuki/components/CardOverview.dart';
import 'package:kuki/components/StudyCardsButton.dart';
import 'package:kuki/models/CardMoldel.dart';
import 'package:kuki/models/Deck.dart';
import 'package:kuki/screens/AddCardScreen.dart';

class DeckDetailScreen extends StatefulWidget {
  final Deck deck;

  DeckDetailScreen(this.deck);

  @override
  State<DeckDetailScreen> createState() => _DeckDetailScreenState();
}

class _DeckDetailScreenState extends State<DeckDetailScreen> {
  Set<int> selectedCards = Set<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deck.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text('Number of Cards: ${widget.deck.cards.length}'),
            const SizedBox(height: 20),
            StudyCardsButton(
              cards: widget.deck.cards,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.deck.cards.length,
                itemBuilder: (context, index) {
                  return CardOverview(
                    card: widget.deck.cards[index],
                    isSelected: selectedCards.contains(index),
                    onDelete: _deleteSelectedCard,
                    isAnySelected: selectedCards.isNotEmpty,
                    onSelect: () {
                      setState(() {
                        // Toggle card selection
                        if (selectedCards.contains(index)) {
                          selectedCards.remove(index);
                        } else {
                          selectedCards.add(index);
                        }
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCardScreen(
                  onCardAdded: (CardModel card) {
                    setState(() {
                      widget.deck.cards.add(card);
                    });
                  },
                ),
              ),
            );
          },
          child: const Text("Add Card"),
        ),
      ),
      bottomNavigationBar: selectedCards.isNotEmpty
          ? BottomAppBar(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            selectedCards.clear();
                            setState(() {});
                          },
                          icon: const Icon(Icons.cancel_outlined),
                        ),
                        Text('${selectedCards.length} selected'),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteSelectedCards();
                      },
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  void _deleteSelectedCard(CardModel card) {
    setState(() {
      widget.deck.cards.remove(card);
      selectedCards.clear();
    });
  }

  void _deleteSelectedCards() {
    List<int> selectedIndexes = selectedCards.toList()..sort();

    for (int i = selectedIndexes.length - 1; i >= 0; i--) {
      int selectedIndex = selectedIndexes[i];
      widget.deck.cards.removeAt(selectedIndex);
    }

    // Clear selected cards after deletion
    selectedCards.clear();

    // Force rebuild to reflect the changes
    setState(() {});
  }
}
