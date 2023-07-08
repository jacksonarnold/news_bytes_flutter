import 'package:flutter/material.dart';
import 'package:news_bytes/story_view.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  // Your news data would go here. For now, this is just a list of example strings
  List<String> newsItems = ['News 1', 'News 2', 'News 3', 'News 4', 'News 5'];

  PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: newsItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Show the news article in a new screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return StoryView(newsItem: newsItems[index]);
                    },
                  ),
                );
              },
              child: FractionallySizedBox(
                alignment: Alignment.topCenter,
                widthFactor: 1,
                heightFactor: 1,
                child: Card(
                  color: Colors.red,
                  child: Column(
                    children: <Widget>[
                      Text(
                        newsItems[index],
                        style: TextStyle(fontSize: 24),
                      ),
                      // Add the contents of your news article here
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
