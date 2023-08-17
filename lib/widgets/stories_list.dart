import 'package:flutter/material.dart';
import '../views/story_view.dart';

class StoriesList extends StatelessWidget {
  final List<Map<String, String>> stories;

  const StoriesList({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: stories.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.white60,
        thickness: 0.5,
      ),
      itemBuilder: (context, index) {
        final story = stories[index];
        return ListTile(
          leading: Image.asset(story['image']!),
          title: Text(story['headline']!),
          onTap: () {
            // Show the news article in a new screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return StoryView(
                    newsItem: story["headline"]!,
                    imageUrl:
                        'https://cdn.houstonpublicmedia.org/wp-content/uploads/2021/11/05154405/Clinic-1000x667.jpg',
                    storyPath: 'assets/text/medicaid_summary.txt',
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
