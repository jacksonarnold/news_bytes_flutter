import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String userName;
  final String profileImageUrl;

  // Constructor to accept the user name and profile image URL
  const UserProfile(
      {super.key, required this.userName, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile image
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                      AssetImage(profileImageUrl), // Load image from assets
                ),
              ),
              const SizedBox(height: 16.0), // Spacer for visual separation
              // User name
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Additional user details can be added here
            ],
          ),
        ),
      ),
    );
  }
}
