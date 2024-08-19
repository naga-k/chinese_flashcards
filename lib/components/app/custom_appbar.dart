import 'package:flashcard/notifiers/flashcards_notifier.dart';
import 'package:flashcard/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder:
          (BuildContext context, FlashcardsNotifier notifier, Widget? child) =>
              AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil<void>(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            },
            icon: const Icon(Icons.clear),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
              tag: notifier.topic,
              child: Image.asset('assets/images/${notifier.topic}.png')),
        ),
        title: Text(notifier.topic),
      ),
    );
  }
}
