import 'package:flashcard/configs/constants.dart';
import 'package:flutter/material.dart';

BoxDecoration flashcardDecoration(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(kCircularBorderRadius),
    border: Border.all(
      color: Colors.white,
      width: kCardBorderWidth,
    ),
    color: Theme.of(context).primaryColor,
  );
}
