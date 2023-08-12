import 'package:flutter/material.dart';
import '../widgets/stories_list.dart';

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

  SavedStoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return StoriesList(stories: stories);
  }
}
