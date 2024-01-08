import 'package:flutter/material.dart';
import 'package:kuki/DeckList.dart';
import 'package:kuki/DummyData.dart';
import 'package:kuki/models/CardMoldel.dart';
import 'package:kuki/models/Deck.dart';

import 'DummyData.dart';

class KukiApp extends StatefulWidget {
  @override
  _KukiAppState createState() => _KukiAppState();
}

class _KukiAppState extends State<KukiApp> {
  List decks = DummyData.decks;

  void _showCreateDeckDialog(BuildContext context) {
    TextEditingController deckNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Create a Deck"),
          content: TextField(
            controller: deckNameController,
            decoration: const InputDecoration(labelText: "Deck Name"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String deckName = deckNameController.text;
                if (deckName.isNotEmpty) {
                  // DummyData.addDeck(deckName);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Kuki",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
          child: decks.isEmpty
              ? ElevatedButton(
                  onPressed: () {
                    // Yeni bir deck oluştur ve listeye ekle
                    _showCreateDeckDialog(context);
                  },
                  child: const Text("Create a Dec"),
                )
              : Column(
                  children: [
                    Expanded(
                      child: DeckList(),
                    ),
                    BottomAppBar(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // Yeni bir deck oluştur ve listeye ekle
                            _showCreateDeckDialog(context);
                          },
                          child: const Text("Create a Dec"),
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
