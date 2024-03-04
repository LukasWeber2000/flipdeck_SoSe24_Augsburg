import 'package:flutter/material.dart';
import 'deck.dart';
import 'flashcard_editor_view.dart'; // Annahme: Ihre FlashcardEditorView-Klasse befindet sich in flashcard_editor_view.dart
import 'learn_view.dart'; // Annahme: Ihre LearnView-Klasse befindet sich in learn_view.dart

class StapelAuswahl extends StatelessWidget {
  final List<Deck> decks;
  final Function() openAddDeckDialog;
  String currentDeck;

  StapelAuswahl({
    required this.decks,
    required this.openAddDeckDialog,
    required this.currentDeck,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Stapelauswahl",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      for (var deck in decks)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF549186)),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(10),
                                    left: Radius.circular(10))),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    '${deck.name} ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                  OutlinedButton(
                                    onPressed: () {
                                      currentDeck = deck.name;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FlashcardEditorView()),
                                      );
                                    },
                                    child: Icon(Icons.add),
                                    style: OutlinedButton.styleFrom(
                                        shape: CircleBorder(),
                                        foregroundColor: Color(0xFF549186)),
                                  ),
                                ],
                              ),
                              onTap: () {
                                currentDeck = deck.name;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Learn()),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        OutlinedButton(
          onPressed: openAddDeckDialog,
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xFF549186)),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF549186)),
                  borderRadius: BorderRadius.circular(8))),
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
