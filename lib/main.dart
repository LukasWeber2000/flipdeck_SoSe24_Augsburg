import 'package:easy_flashcard/deck_selection_view.dart';
import 'package:flutter/material.dart';

import 'add_deck_dialog.dart';
import 'custom_appbar.dart';
import 'custom_drawer.dart';
import 'decks.dart';
import 'learn_view.dart';

void main() {
  runApp(DeckView());
}

class DeckView extends StatelessWidget {
  DeckView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.white10, // Set the background color here
      ),
      home: Builder(builder: (context) {
      return Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppbar(
              onRightButtonPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              onLeftButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Learn()),
                );
              },
              rightIcon: Icons.menu,
              leftIcon: Icons.arrow_back,
            ),
            endDrawer: const CustomDrawer(),
            body: DeckSelection(
              decks: decks,
              openAddDeckDialog: () {
                AddDeckDialog.show(context, decks);
              },
              currentDeck: currentDeck,
            ),
          ));
    }
    ));
  }
}
