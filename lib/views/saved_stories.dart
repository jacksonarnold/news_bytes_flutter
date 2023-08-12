import 'package:flutter/material.dart';

class SavedStoriesList extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      'headline': 'Ukraine Ambassador Open To More Scrutiny Of U.S. Aid',
      'image': 'assets/images/ukraine_story.webp'
    },
    {
      'headline': 'Russia downs 20 drones over Crimea following a spate of attacks on Moscow',
      'image': 'assets/images/russia_drones.jpeg'
    },
    {
      'headline': 'Team Biden: Ohio is our validation',
      'image': 'assets/images/biden.jpeg'
    },
    {
      'headline': 'Trump campaign brings in longtime political operative to lead Florida effort',
      'image': 'assets/images/trump.jpeg'
    },
    {
      'headline': 'Ohio’s abortion battle is just getting started',
      'image': 'assets/images/abortion.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stories.length,
      // separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final story = stories[index];
        return ListTile(
          leading: Image.asset(story['image']!),
          title: Text(story['headline']!),
          onTap: () {
            // TODO: Implement navigation to story details
          },
        );
      },
    );
  }
}
