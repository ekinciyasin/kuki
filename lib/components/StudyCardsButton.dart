import 'package:flutter/material.dart';
import 'package:kuki/models/CardMoldel.dart';
import 'package:kuki/screens/StudyScreen.dart';

class StudyCardsButton extends StatelessWidget {
  final List<CardModel> cards;
  StudyCardsButton({required this.cards});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 70, 164, 242),
          // Set the desired background color
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudyScreen(cards: cards),
            ),
          );
        },
        child: const SizedBox(
            width: double.infinity,
            child: Center(
                child: Text(
              'Study Cards',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            ))),
      ),
    );
  }
}
