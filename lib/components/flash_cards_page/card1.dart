import 'package:flashcard/animations/half_flip_animation.dart';
import 'package:flashcard/animations/slide_animation.dart';
import 'package:flashcard/components/flash_cards_page/card_display.dart';
import 'package:flashcard/decorations/flashcard_decoration.dart';
import 'package:flashcard/enum/slide_direction.dart';
import 'package:flashcard/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card1 extends StatelessWidget {
  const Card1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder:
          (BuildContext context, FlashcardsNotifier notifier, Widget? child) =>
              GestureDetector(
        onDoubleTap: () {
          notifier.runFlipCard1();
          notifier.setIgnoreTouches(ignore: true);
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfWay: false,
          animationCompleted: () {
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            animationDuration: 1000,
            animationDelay: 200,
            animationCompleted: () {
              notifier.setIgnoreTouches(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            direction: SlideDirection.upIn,
            animate: notifier.slideCard1,
            child: Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.7,
                decoration: flashcardDecoration(context),
                child: const CardDisplay(isCard1: true),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
