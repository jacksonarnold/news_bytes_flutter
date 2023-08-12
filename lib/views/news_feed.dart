import 'package:flutter/material.dart';
import '../story_view.dart';
import '../widgets/story_card.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  List<String> newsItems = [
    'Ukraine Ambassador Open To More Scrutiny Of U.S. Aid',
    'Russia downs 20 drones over Crimea following a spate of attacks on Moscow',
    'Team Biden: Ohio is our validation',
    'Trump campaign brings in longtime political operative to lead Florida effort',
    'Ohio’s abortion battle is just getting started'
  ];
  List<String> imageUrls = [
    'https://img.huffingtonpost.com/asset/64d68f932500005a003a8a98.jpg?ops=scalefit_1280_noupscale&format=webp',
    'https://www.politico.com/dims4/default/e26c3cc/2147483647/strip/true/crop/6000x4000+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F2d%2Fa6%2F32ad03ae413a865a817c90333121%2Frussia-ukraine-drone-attack-96996.jpg',
    'https://www.politico.com/dims4/default/8c3e667/2147483647/strip/true/crop/4063x2709+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F1b%2F01%2Fafcb7731499d8e4355b1a4db6307%2Fbiden-98156.jpg',
    'https://www.politico.com/dims4/default/51b3e71/2147483647/strip/true/crop/2697x1820+0+0/resize/1260x850!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2Fe0%2Fff%2F39c477bd49e99e9878385aa8e6cd%2Ffl-election-2018-florida-news-guide-30823.jpg',
    'https://www.politico.com/dims4/default/41807e5/2147483647/resize/1524x/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F4a%2F57%2F29276f334da2aefb71e90c818167%2Fwr-leadimage-08-11-23-2.png'
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
