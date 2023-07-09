import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class StoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  StoryCard({required this.title, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        alignment: Alignment.topCenter,
        widthFactor: 1,
        heightFactor: .8,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
