import 'package:flutter/material.dart';
import 'story_view.dart';
import '../widgets/story_card.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  List<String> newsItems = [
    'End of Pandemic Coverage Guarantee Leaves Many without Healthcare',
    'Ukraine Ambassador Open to More Scrutiny Of U.S. Aid',
    'Russia downs 20 drones over Crimea following a spate of attacks on Moscow',
    'Team Biden: Ohio is our validation',
    'Sustainability the focus at Paris Air Show',
    'Trump campaign brings in longtime political operative to lead Florida effort',
    'Ohio’s abortion battle is just getting started'
  ];

  List<String> imageUrls = [
    'https://cdn.houstonpublicmedia.org/wp-content/uploads/2021/11/05154405/Clinic-1000x667.jpg',
    'https://img.huffingtonpost.com/asset/64d68f932500005a003a8a98.jpg?ops=scalefit_1280_noupscale&format=webp',
    'https://www.politico.com/dims4/default/e26c3cc/2147483647/strip/true/crop/6000x4000+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F2d%2Fa6%2F32ad03ae413a865a817c90333121%2Frussia-ukraine-drone-attack-96996.jpg',
    'https://www.politico.com/dims4/default/8c3e667/2147483647/strip/true/crop/4063x2709+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F1b%2F01%2Fafcb7731499d8e4355b1a4db6307%2Fbiden-98156.jpg',
    'https://www.uas.aero/wp-content/uploads/2015/06/Paris_AirShow3-1.jpg',
    'https://www.politico.com/dims4/default/51b3e71/2147483647/strip/true/crop/2697x1820+0+0/resize/1260x850!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2Fe0%2Fff%2F39c477bd49e99e9878385aa8e6cd%2Ffl-election-2018-florida-news-guide-30823.jpg',
    'https://www.politico.com/dims4/default/41807e5/2147483647/resize/1524x/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F4a%2F57%2F29276f334da2aefb71e90c818167%2Fwr-leadimage-08-11-23-2.png'
  ];

  List<String> subtitles = [
    'Over 1 million people have been removed from Medicaid as states end pandemic-era coverage.',
    "After several flags were raised, the Ukrainian ambassador said that they would be open to taking a deeper look of money received from the U.S.",
    "Russia ramped up its defenses after several weeks of fierce attacks by the Ukrainians on key infrastructural points for the Russians.",
    "The Biden campaign continues to see Ohio as an all important battleground state in the upcoming election cycle.",
    'The Paris Air Show highlighted sustainability in aviation with a focus on reducing greenhouse gas emissions.',
    "Trump sees Florida as one of his toughest challenges in the Republican primary to start later this year.",
    "In the 'purple' state of Ohio, abortion has been a raging battle that could serve as a litmus test for the 2024 election."
  ];

  List<String> storypaths = [
    'assets/text/medicaid_summary.txt',
    'assets/text/medicaid_summary.txt',
    'assets/text/medicaid_summary.txt',
    'assets/text/medicaid_summary.txt',
    'assets/text/paris_air_summary.txt',
    'assets/text/medicaid_summary.txt',
    'assets/text/medicaid_summary.txt'
  ];

  final PageController _pageController = PageController(viewportFraction: 0.85);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FloatingActionButton(
              onPressed: () {
                _pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              backgroundColor: Colors.black,
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            )),
        title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: List.generate(newsItems.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Hexagonal border
                        ClipPath(
                          clipper: HexagonClipper(),
                          child: Container(
                            width: 36,  // Slightly larger to accommodate the border
                            height: 36, // Slightly larger to accommodate the border
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: currentPage == index
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 10.0,
                              ),
                            ),
                          ),
                        ),
                        // Hexagonal image
                        ClipPath(
                          clipper: HexagonClipper(),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(imageUrls[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
        ),
      ),
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: newsItems.length,
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: StoryCard(
                title: newsItems[index],
                subtitle: subtitles[index],
                imageUrl: imageUrls[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return StoryView(
                          newsItem: newsItems[index],
                          imageUrl: imageUrls[index],
                          storyPath: storypaths[index],
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


// Define the CustomClipper class
class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.75);
    path.lineTo(0, size.height * 0.25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
