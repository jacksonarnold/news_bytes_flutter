import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'amplifyconfiguration.dart';
import 'news_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      final authPlugin = AmplifyAuthCognito();
      await Amplify.addPlugin(authPlugin);

      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      // TODO: push error
      safePrint(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android."
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        title: 'NewsBytes',
        debugShowCheckedModeBanner: false, // This line hides the debug banner
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                background: Colors.black,
                primary: Colors.black),
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.black),
        builder: Authenticator.builder(),
        home: const Scaffold(
          body: Center(
            child: NewsFeed(),
          ),
        ),
      ),
    );
  }
}
