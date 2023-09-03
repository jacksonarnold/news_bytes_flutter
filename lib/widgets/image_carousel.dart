import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> newsItems;
  final List<String> imageUrls;
  final int currentPage;
  final PageController pageController;

  const ImageCarousel({
    super.key,
    required this.newsItems,
    required this.imageUrls,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: List.generate(newsItems.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: GestureDetector(
              onTap: () {
                pageController.animateToPage(index,
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
                      width: 36,
                      height: 36,
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
      ),
    );
  }
}


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
