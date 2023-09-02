import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:news_bytes/views/chat_view.dart';

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
    return GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dx > 200) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 70.0), // Adding 70.0 units of padding to the bottom
                child: Column(
                  children: [
                    // Displaying the image
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        newsItem,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    FutureBuilder<String>(
                      future: loadAsset(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatView()),
              );
            },
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.chat),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }
}
