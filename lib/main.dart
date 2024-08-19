import 'package:flashcard/configs/themes.dart';
import 'package:flashcard/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FlashcardsNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chinese Flashcards',
      theme: appTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false, // Hide the debug banner
    );
  }
}
