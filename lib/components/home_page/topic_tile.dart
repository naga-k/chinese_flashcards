import 'package:flashcard/animations/fade_in_animation.dart';
import 'package:flashcard/configs/constants.dart';
import 'package:flashcard/utils/methods.dart';
import 'package:flutter/material.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    super.key,
    required String topic,
  }) : _topic = topic;

  final String _topic;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: GestureDetector(
        onTap: () {
          print('Topic: $_topic');
          loadSession(context, _topic);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(kCircularBorderRadius),
          ),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                        tag: _topic,
                        child: Image.asset('assets/images/$_topic.png')),
                  ),
                ),
                Expanded(
                  child: Text(
                    _topic,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
