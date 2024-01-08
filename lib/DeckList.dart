import 'package:flutter/material.dart';
import 'package:kuki/DummyData.dart';
import 'package:kuki/models/Deck.dart';
import 'package:kuki/screens/DeckDetailScreen.dart';

class DeckList extends StatefulWidget {
  @override
  State<DeckList> createState() => _DeckListState();
}

class _DeckListState extends State<DeckList> {
  void _navigateToDeckDetail(BuildContext context, Deck deck) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DeckDetailScreen(deck),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DummyData.decks.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(DummyData.decks[index].name),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          confirmDismiss: (DismissDirection direction) async {
            return await _showDeleteConfirmationDialog(context);
          },
          child: InkWell(
            onTap: () {
              _navigateToDeckDetail(context, DummyData.decks[index]);
              print('Item clicked: ${DummyData.decks[index].name}');
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Card(
                elevation:
                    0, // Set elevation to 0 to remove default card shadow
                child: ListTile(
                  title: Text(DummyData.decks[index].name),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure you want to delete?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }
}
