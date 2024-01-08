import 'package:flutter/material.dart';
import 'package:kuki/models/CardMoldel.dart';

class AddCardAppBarButton extends StatelessWidget {
  final TextEditingController frontController;
  final TextEditingController backController;
  final Function(CardModel) onCardAdded;

  // Add this line to store the context
  final BuildContext context;

  AddCardAppBarButton({
    required this.frontController,
    required this.backController,
    required this.onCardAdded,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      width: 60,
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 64, 236, 255),
          ),
        ),
        onPressed: () {
          String frontSide = frontController.text;
          String backSide = backController.text;

          if (frontSide.isNotEmpty && backSide.isNotEmpty) {
            CardModel newCard = CardModel(front: frontSide, back: backSide);
            onCardAdded(newCard);

            // Clear text fields after adding a card
            frontController.clear();
            backController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color.fromARGB(255, 63, 90, 103),
                content: Text('Card added!',
                    style: TextStyle(
                        color: Color.fromARGB(255, 65, 233, 152),
                        fontWeight: FontWeight.w900)),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        icon: const Icon(Icons.check, color: Colors.black),
        color: const Color.fromARGB(255, 14, 15, 16),
      ),
    );
  }
}
