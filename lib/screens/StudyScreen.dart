import 'package:flutter/material.dart';
import 'package:kuki/models/CardMoldel.dart';

class StudyScreen extends StatefulWidget {
  final List<CardModel> cards;

  StudyScreen({required this.cards});

  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int currentIndex = 0;
  bool showFrontSide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Cards'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            showFrontSide = !showFrontSide;
          });
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: showFrontSide
                ? Text(
                    widget.cards[currentIndex].front,
                    style: TextStyle(fontSize: 18.0),
                  )
                : Text(
                    widget.cards[currentIndex].back,
                    style: TextStyle(fontSize: 18.0),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Go to the next card or loop back to the first one
            currentIndex = (currentIndex + 1) % widget.cards.length;
            // Show the front side when transitioning to the next card
            showFrontSide = true;
          });
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
