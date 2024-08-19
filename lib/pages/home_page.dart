import 'package:flashcard/animations/fade_in_animation.dart';
import 'package:flashcard/components/home_page/topic_tile.dart';
import 'package:flashcard/configs/constants.dart';
import 'package:flashcard/data/words.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String?> _topics = [];

  @override
  void initState() {
    for (var t in words) {
      if (!_topics.contains(t.topic)) {
        _topics.add(t.topic);
      }
    }
    _topics.sort();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        toolbarHeight: size.height * 0.15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    width: size.width * kIconPadding,
                    child: Image.asset('assets/images/Settings.png')),
                SizedBox(height: size.height * kIconPadding),
              ],
            ),
            const FadeInAnimation(
              child: Text(
                appTitle,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                SizedBox(
                    width: size.width * kIconPadding,
                    child: Image.asset('assets/images/Review.png')),
                SizedBox(height: size.height * kIconPadding),
              ],
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor, // Add this line
      ),
      body: Padding(
        padding: const EdgeInsets.only(),
        child: Padding(
          padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Theme.of(context)
                      .scaffoldBackgroundColor, // Add this line
                  expandedHeight: size.height * 0.4,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsets.all(size.width * 0.1),
                      // child: Image.asset('assets/images/Dragon.png'),
                      child: FadeInAnimation(
                          child: Image.asset('assets/images/Dragon.png')),
                    ),
                  ) // Add this line
                  ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: _topics.length,
                  (context, index) => TopicTile(topic: _topics[index]!),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
