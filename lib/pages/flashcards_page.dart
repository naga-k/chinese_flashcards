import 'package:flashcard/components/app/custom_appbar.dart';
import 'package:flashcard/components/flash_cards_page/card1.dart';
import 'package:flashcard/components/flash_cards_page/card2.dart';
import 'package:flashcard/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final FlashcardsNotifier flashcardsNotifier =
          Provider.of<FlashcardsNotifier>(context, listen: false);
      flashcardsNotifier.runSlideCard1();
      flashcardsNotifier.generateAllSelectedWords();
      flashcardsNotifier.generateCurrentWord();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
        builder: (BuildContext context, FlashcardsNotifier notifier,
                Widget? child) =>
            Scaffold(
                appBar: const PreferredSize(
                    preferredSize: Size.fromHeight(56), child: CustomAppBar()),
                body: IgnorePointer(
                  ignoring: notifier.ignoreTouches,
                  child: const Stack(
                    children: [
                      Card1(),
                      Card2(),
                    ],
                  ),
                )));
  }
}
