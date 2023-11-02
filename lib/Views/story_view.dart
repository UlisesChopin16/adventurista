import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';


class StoryViewP extends StatefulWidget {
  const StoryViewP({ Key? key }) : super(key: key);

  @override
  _StoryViewPState createState() => _StoryViewPState();
}

class _StoryViewPState extends State<StoryViewP> {

  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: 'Hello world!',
            backgroundColor: Colors.grey,
          ),
          StoryItem.pageImage(
            url: 'https://picsum.photos/seed/picsum/200/300',
            caption: 'Still cute tho',
            controller: controller,
          ),
        ],
        controller: controller,
        inline: false,
        repeat: false,
      ),
    );
  }
}