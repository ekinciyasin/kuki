import 'package:flutter/material.dart';
import 'package:kuki/models/CardMoldel.dart';
import 'package:kuki/models/Deck.dart';

class CardOverview extends StatelessWidget {
  final CardModel card;
  final bool isSelected;
  final VoidCallback onSelect;
  final Function(CardModel) onDelete;
  final bool isAnySelected;

  CardOverview({
    required this.card,
    required this.isSelected,
    required this.onSelect,
    required this.onDelete,
    required this.isAnySelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        onSelect();
      },
      onTap: isAnySelected
          ? () {
              onSelect();
            }
          : null,
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: isSelected
            ? RoundedRectangleBorder(
                side: const BorderSide(
                    color: const Color.fromARGB(255, 84, 176, 252), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              )
            : null,
        child: ListTile(
          title: Text(card.front),
          subtitle: Text(card.back, style: TextStyle(color: Colors.grey[400])),
          trailing: isSelected
              ? const Icon(Icons.check_circle, color: Colors.blue)
              : isAnySelected
                  ? const Icon(Icons.circle_outlined)
                  : PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) {
                        // Seçilen menü öğesine göre işlemleri burada gerçekleştirin
                        if (value == 'select') {
                          onSelect();
                        } else if (value == 'delete') {
                          onDelete(card);
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'select',
                          child: ListTile(
                            leading: Icon(Icons.check),
                            title: Text('Select'),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
