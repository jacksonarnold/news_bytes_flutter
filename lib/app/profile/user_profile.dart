import 'package:flutter/material.dart';
import 'package:news_bytes/app/settings/settings_screen.dart';

class UserProfile extends StatelessWidget {
  final String userName;
  final String profileImageUrl;
  final String email;

  final List<String> imageUrls = [
    'https://cdn.houstonpublicmedia.org/wp-content/uploads/2021/11/05154405/Clinic-1000x667.jpg',
    'https://img.huffingtonpost.com/asset/64d68f932500005a003a8a98.jpg?ops=scalefit_1280_noupscale&format=webp',
    'https://www.politico.com/dims4/default/e26c3cc/2147483647/strip/true/crop/6000x4000+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F2d%2Fa6%2F32ad03ae413a865a817c90333121%2Frussia-ukraine-drone-attack-96996.jpg',
    'https://www.politico.com/dims4/default/8c3e667/2147483647/strip/true/crop/4063x2709+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F1b%2F01%2Fafcb7731499d8e4355b1a4db6307%2Fbiden-98156.jpg',
    'https://www.uas.aero/wp-content/uploads/2015/06/Paris_AirShow3-1.jpg',
    'https://www.politico.com/dims4/default/51b3e71/2147483647/strip/true/crop/2697x1820+0+0/resize/1260x850!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2Fe0%2Fff%2F39c477bd49e99e9878385aa8e6cd%2Ffl-election-2018-florida-news-guide-30823.jpg',
    'https://www.politico.com/dims4/default/41807e5/2147483647/resize/1524x/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F4a%2F57%2F29276f334da2aefb71e90c818167%2Fwr-leadimage-08-11-23-2.png',
    'https://cdn.houstonpublicmedia.org/wp-content/uploads/2021/11/05154405/Clinic-1000x667.jpg',
    'https://img.huffingtonpost.com/asset/64d68f932500005a003a8a98.jpg?ops=scalefit_1280_noupscale&format=webp',
    'https://www.politico.com/dims4/default/e26c3cc/2147483647/strip/true/crop/6000x4000+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F2d%2Fa6%2F32ad03ae413a865a817c90333121%2Frussia-ukraine-drone-attack-96996.jpg',
    'https://www.politico.com/dims4/default/8c3e667/2147483647/strip/true/crop/4063x2709+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F1b%2F01%2Fafcb7731499d8e4355b1a4db6307%2Fbiden-98156.jpg',
    'https://www.uas.aero/wp-content/uploads/2015/06/Paris_AirShow3-1.jpg',
    'https://www.politico.com/dims4/default/51b3e71/2147483647/strip/true/crop/2697x1820+0+0/resize/1260x850!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2Fe0%2Fff%2F39c477bd49e99e9878385aa8e6cd%2Ffl-election-2018-florida-news-guide-30823.jpg',
    'https://www.politico.com/dims4/default/41807e5/2147483647/resize/1524x/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F4a%2F57%2F29276f334da2aefb71e90c818167%2Fwr-leadimage-08-11-23-2.png',
    'https://cdn.houstonpublicmedia.org/wp-content/uploads/2021/11/05154405/Clinic-1000x667.jpg',
    'https://img.huffingtonpost.com/asset/64d68f932500005a003a8a98.jpg?ops=scalefit_1280_noupscale&format=webp',
    'https://www.politico.com/dims4/default/e26c3cc/2147483647/strip/true/crop/6000x4000+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F2d%2Fa6%2F32ad03ae413a865a817c90333121%2Frussia-ukraine-drone-attack-96996.jpg',
    'https://www.politico.com/dims4/default/8c3e667/2147483647/strip/true/crop/4063x2709+0+0/resize/1260x840!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F1b%2F01%2Fafcb7731499d8e4355b1a4db6307%2Fbiden-98156.jpg',
    'https://www.uas.aero/wp-content/uploads/2015/06/Paris_AirShow3-1.jpg',
    'https://www.politico.com/dims4/default/51b3e71/2147483647/strip/true/crop/2697x1820+0+0/resize/1260x850!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2Fe0%2Fff%2F39c477bd49e99e9878385aa8e6cd%2Ffl-election-2018-florida-news-guide-30823.jpg',
    'https://www.politico.com/dims4/default/41807e5/2147483647/resize/1524x/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F4a%2F57%2F29276f334da2aefb71e90c818167%2Fwr-leadimage-08-11-23-2.png'
  ];

  UserProfile({
    Key? key,
    required this.userName,
    required this.profileImageUrl,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Settings Button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      // Navigate to Settings screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const SettingsScreen();
                          },
                        ),
                      );
                    },
                  ),
                ),
                // Profile image
                Center(
                  child: CircleAvatar(
                    radius: 65.0,
                    backgroundImage: AssetImage(profileImageUrl),
                  ),
                ),
                const SizedBox(height: 16.0),
                // User name
                Center(
                  child: Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 6.0),
                // Email
                Center(
                  child: Text(
                    email,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                // "Saved" pill
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white54, width: 1)),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Saved", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 20.0),
                // 4x4 Grid of Square Images for Saved Stories
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  ),
                  itemCount: imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
