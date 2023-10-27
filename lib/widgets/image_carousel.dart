import 'package:flutter/material.dart';
import '../utils/hexagon_clipper.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final int currentPage;
  final PageController pageController;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: List.generate(imageUrls.length, (index) {
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
