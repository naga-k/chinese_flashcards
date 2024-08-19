import 'dart:math';

import 'package:flashcard/configs/constants.dart';
import 'package:flashcard/data/words.dart';
import 'package:flashcard/enum/slide_direction.dart';
import 'package:flashcard/models/word.dart';
import 'package:flutter/material.dart';

class FlashcardsNotifier extends ChangeNotifier {
  String _topic = '';
  Word word1 =
      Word(topic: "", english: "Loading Arrow", character: "", pinyin: "");
  Word word2 = Word(topic: "", english: "", character: "", pinyin: "");
  List<Word> selectedWords = [];

  String get topic => _topic;

  void setTopic({required String topic}) {
    _topic = topic;
    notifyListeners();
  }

  generateAllSelectedWords() {
    selectedWords.clear();
    words.where((element) => element.topic == _topic).forEach((element) {
      selectedWords.add(element);
    });
  }

  generateCurrentWord() {
    if (selectedWords.isEmpty) {
      generateAllSelectedWords();
    }

    if (selectedWords.isNotEmpty) {
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    }

    Future.delayed(const Duration(milliseconds: kSlideAwayDuration), () {
      word2 = word1;
    });
  }

  /// Animation Code
  bool ignoreTouches = true;

  setIgnoreTouches({required bool ignore}) {
    ignoreTouches = ignore;
    notifyListeners();
  }

  SlideDirection swipedDirection = SlideDirection.none;

  bool slideCard1 = false;
  bool flipCard1 = false;
  bool flipCard2 = false;
  bool swipeCard2 = false;

  bool resetSlideCard1 = false;
  bool resetFlipCard1 = false;
  bool resetFlipCard2 = false;
  bool resetSwipeCard2 = false;

  runSlideCard1() {
    resetSlideCard1 = false;
    slideCard1 = true;
    notifyListeners();
  }

  runFlipCard1() {
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  resetCard1() {
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    slideCard1 = false;
    flipCard1 = false;
    notifyListeners();
  }

  runFlipCard2() {
    resetFlipCard2 = false;
    flipCard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}) {
    swipedDirection = direction;
    swipeCard2 = true;
    resetSwipeCard2 = false;
    notifyListeners();
  }

  resetCard2() {
    resetFlipCard2 = true;
    resetSwipeCard2 = true;
    flipCard2 = false;
    swipeCard2 = false;
    notifyListeners();
  }
}
