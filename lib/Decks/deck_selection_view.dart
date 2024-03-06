import 'package:flutter/material.dart';
import '../Models/deck.dart';
import '../Editor/editor_view.dart';
import '../Learn/learn_view.dart';

class DeckSelection extends StatelessWidget {
  final List<Deck> decks;
  final Function() openAddDeckDialog;

  const DeckSelection({
    super.key,
    required this.decks,
    required this.openAddDeckDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top:15.0, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Deck Selection",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          ),
        ),

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
                                border:
                                    Border.all(color: const Color(0xFF549186)),
                                borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(10),
                                    left: Radius.circular(10))),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    '${deck.name} ',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Spacer(),
                                  OutlinedButton(
                                    onPressed: () {
                                      currentDeck = deck.name;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FlashcardEditorView()),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        foregroundColor:
                                            const Color(0xFF549186)),
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                              onTap: () {
                                currentDeck = deck.name;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Learn()),
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
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: OutlinedButton(
            onPressed: openAddDeckDialog,
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF549186)),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF549186)),
                    borderRadius: BorderRadius.circular(8))),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
