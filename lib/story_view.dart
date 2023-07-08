import 'package:flutter/material.dart';

class StoryView extends StatelessWidget {
  final String newsItem;

  const StoryView({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            newsItem,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
