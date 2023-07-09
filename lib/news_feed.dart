import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'story_view.dart';
import 'story_card.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  List<String> newsItems = ['News 1', 'News 2', 'News 3', 'News 4', 'News 5'];
  List<String> imageUrls = [
    'https://fastly.picsum.photos/id/643/200/300.jpg?hmac=rS-MHa0BIMHdAgm-FZ7QM36aRKEAzzhSRNRv5n4uqGc',
    'https://fastly.picsum.photos/id/643/200/300.jpg?hmac=rS-MHa0BIMHdAgm-FZ7QM36aRKEAzzhSRNRv5n4uqGc',
    'https://fastly.picsum.photos/id/643/200/300.jpg?hmac=rS-MHa0BIMHdAgm-FZ7QM36aRKEAzzhSRNRv5n4uqGc',
    'https://fastly.picsum.photos/id/643/200/300.jpg?hmac=rS-MHa0BIMHdAgm-FZ7QM36aRKEAzzhSRNRv5n4uqGc',
    'https://fastly.picsum.photos/id/643/200/300.jpg?hmac=rS-MHa0BIMHdAgm-FZ7QM36aRKEAzzhSRNRv5n4uqGc'
  ];

  final PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: newsItems.length,
          itemBuilder: (BuildContext context, int index) {
            return StoryCard(
              title: newsItems[index],
              imageUrl: imageUrls[index],
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
            );
          },
        ),
      ),
    );
  }
}
