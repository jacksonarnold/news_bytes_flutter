import 'package:flutter/material.dart';
import 'package:news_bytes/views/news_feed.dart';
import 'package:news_bytes/views/saved_stories.dart';
import 'package:news_bytes/views/user_profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 65,
        backgroundColor: Colors.black,
        indicatorColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.dynamic_feed_outlined),
            icon: Icon(Icons.dynamic_feed_sharp),
            label: 'Feed',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const NewsFeed(),
        ),
        Container(
          alignment: Alignment.center,
          child: SavedStoriesList(),
        ),
        Container(
          alignment: Alignment.center,
          child: const UserProfile(
            userName: 'John Doe',
            profileImageUrl: 'assets/images/Pedro-Fake-Profile-696x392.jpg',
          ),
        ),
      ][currentPageIndex],
    );
  }
}
