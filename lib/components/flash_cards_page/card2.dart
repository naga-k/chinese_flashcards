import 'dart:math';

import 'package:flashcard/animations/half_flip_animation.dart';
import 'package:flashcard/animations/slide_animation.dart';
import 'package:flashcard/components/flash_cards_page/card_display.dart';
import 'package:flashcard/decorations/flashcard_decoration.dart';
import 'package:flashcard/enum/slide_direction.dart';
import 'package:flashcard/notifiers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder:
          (BuildContext context, FlashcardsNotifier notifier, Widget? child) {
        return GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 100) {
              notifier.runSwipeCard2(direction: SlideDirection.leftAway);
              notifier.runSlideCard1();
              notifier.setIgnoreTouches(ignore: true);
              notifier.generateCurrentWord();
            }

            if (details.primaryVelocity! < -100) {
              notifier.runSwipeCard2(direction: SlideDirection.rightAway);
              notifier.runSlideCard1();
              notifier.setIgnoreTouches(ignore: true);
              notifier.generateCurrentWord();
            }
          },
          child: HalfFlipAnimation(
            animate: notifier.flipCard2,
            reset: notifier.resetFlipCard2,
            flipFromHalfWay: true,
            animationCompleted: () {
              notifier.setIgnoreTouches(ignore: false);
            },
            child: SlideAnimation(
              animationCompleted: () {
                notifier.resetCard2();
              },
              direction: notifier.swipedDirection,
              animate: notifier.swipeCard2,
              reset: notifier.resetSwipeCard2,
              child: Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.7,
                  decoration: flashcardDecoration(context),
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: const CardDisplay(isCard1: false)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
