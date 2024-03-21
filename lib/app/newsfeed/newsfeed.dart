import 'package:flutter/material.dart';
import 'newsfeed_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/image_carousel.dart';
import '../story/story_view.dart';
import '../../widgets/story_card.dart';
import 'newsfeed_provider.dart';

class NewsFeed extends ConsumerStatefulWidget {
  const NewsFeed({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => NewsFeedState();
}

class NewsFeedState extends ConsumerState<NewsFeed> {
  List<String> imageUrls = [
    'https://cdn.houstonpublicmedia.org/wp-content/uploads/2021/11/05154405/Clinic-1000x667.jpg',
    'https://img.huffingtonpost.com/asset/64d68f932500005a003a8a98.jpg?ops=scalefit_1280_noupscale&format=webp',
    'https://www.politico.com/dims4/default/e26c3cc/2147483647/strip/true/crop/6000x4000+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F2d%2Fa6%2F32ad03ae413a865a817c90333121%2Frussia-ukraine-drone-attack-96996.jpg',
    'https://www.politico.com/dims4/default/8c3e667/2147483647/strip/true/crop/4063x2709+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F1b%2F01%2Fafcb7731499d8e4355b1a4db6307%2Fbiden-98156.jpg',
    'https://www.uas.aero/wp-content/uploads/2015/06/Paris_AirShow3-1.jpg',
    'https://www.politico.com/dims4/default/51b3e71/2147483647/strip/true/crop/2697x1820+0+0/resize/1260x850!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2Fe0%2Fff%2F39c477bd49e99e9878385aa8e6cd%2Ffl-election-2018-florida-news-guide-30823.jpg',
    'https://www.politico.com/dims4/default/41807e5/2147483647/resize/1524x/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F4a%2F57%2F29276f334da2aefb71e90c818167%2Fwr-leadimage-08-11-23-2.png'
  ];

  final PageController _pageController = PageController(viewportFraction: 0.85);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    ref.listenManual(newsFeedProvider, (previous, next) {});
  }

  @override
  Widget build(BuildContext context) {
    // "ref" is not passed as parameter anymore, but is instead a property of "ConsumerState".
    // We can therefore keep using "ref.watch" inside "build".
    final AsyncValue<NewsFeedModel> newsFeed = ref.watch(newsFeedProvider);

    return Center(
        child: switch (newsFeed) {
      AsyncData(:final value) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    ref.invalidate(newsFeedProvider);
                  },
                  backgroundColor: Colors.black,
                  child: const Image(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            title: ImageCarousel(
              imageUrls: imageUrls,
              currentPage: currentPage,
              pageController: _pageController,
            ),
          ),
          body: SafeArea(
              child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: value.storyList.length,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: StoryCard(
                        title: value.storyList[index].originalTitle,
                        subtitle: value.storyList[index].originalStory,
                        imageUrl: imageUrls[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return StoryView(
                                  newsItem:
                                      value.storyList[index].originalTitle,
                                  imageUrl: imageUrls[index],
                                  storyPath:
                                      value.storyList[index].originalStory,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  })),
        ),
      AsyncError() => const Text('Oops, something unexpected happened'),
      _ => const CircularProgressIndicator(),
    });
  }
}
