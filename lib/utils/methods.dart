import 'package:flashcard/notifiers/flashcards_notifier.dart';
import 'package:flashcard/pages/flashcards_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

loadSession(BuildContext context, dynamic topic) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const FlashcardsPage()));
  Provider.of<FlashcardsNotifier>(context, listen: false)
      .setTopic(topic: topic);
}
