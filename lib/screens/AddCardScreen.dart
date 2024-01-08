import 'package:flutter/material.dart';
import 'package:kuki/components/AddCardAppBarButton.dart';
import 'package:kuki/models/CardMoldel.dart';

class AddCardScreen extends StatelessWidget {
  final Function(CardModel) onCardAdded;
  final TextEditingController frontController = TextEditingController();
  final TextEditingController backController = TextEditingController();

  AddCardScreen({required this.onCardAdded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Card')),
        actions: [
          AddCardAppBarButton(
            frontController: frontController,
            backController: backController,
            onCardAdded: onCardAdded,
            context: context,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                expands: true,
                minLines: null,
                maxLines: null,
                controller: frontController,
                decoration: const InputDecoration(
                  labelText: 'Front Side',
                  filled: true,
                  fillColor: Color.fromARGB(255, 51, 51, 51),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 51, 51, 51),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                expands: true,
                minLines: null,
                maxLines: null,
                controller: backController,
                decoration: const InputDecoration(
                  labelText: 'Back Side',
                  filled: true,
                  fillColor: Color.fromARGB(255, 51, 51, 51),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 60, 60, 61),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
