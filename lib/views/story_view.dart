import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class StoryView extends StatelessWidget {
  final String newsItem;
  final String imageUrl;
  final String storyPath;

  const StoryView(
      {Key? key,
      required this.newsItem,
      required this.imageUrl,
      required this.storyPath})
      : super(key: key);

  Future<String> loadAsset() async {
    return await rootBundle.loadString(storyPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Displaying the image
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              // Title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  newsItem,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              // Text from the file
              FutureBuilder<String>(
                future: loadAsset(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MarkdownBody(data: snapshot.data ?? ''),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
