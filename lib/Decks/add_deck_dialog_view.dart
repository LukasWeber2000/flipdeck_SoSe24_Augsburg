import 'package:flutter/material.dart';

import '../Models/deck.dart';

class AddDeckDialog {
  static void show(BuildContext context, List<Deck> decks) {
    TextEditingController textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Chose deck name'),
          content: TextField(
            controller: textFieldController,
            decoration: const InputDecoration(hintText: "Deck name"),
            maxLength: 30,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                // Hier können Sie die Logik zum Speichern des Kartenstapelnamens implementieren
                String deckName = textFieldController.text;
                decks.add(Deck(name: deckName));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}