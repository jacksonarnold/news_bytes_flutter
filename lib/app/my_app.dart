import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:news_bytes/views/home.dart';
import 'package:news_bytes/widgets/logo_scaffold.dart';
import '../views/news_feed.dart';
import 'amplifyconfiguration.dart';

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
      // can remove the below authenticatorBuilder code to use complete default settings
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return LogoScaffold(
              state: state,
              // A prebuilt Sign In form from amplify_authenticator
              body: SignInForm(),
              // A custom footer with a button to take the user to sign up
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () => state.changeStep(
                      AuthenticatorStep.signUp,
                    ),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.signUp:
            return LogoScaffold(
              state: state,
              // A prebuilt Sign Up form from amplify_authenticator
              body: SignUpForm(),
              // A custom footer with a button to take the user to sign in
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => state.changeStep(
                      AuthenticatorStep.signIn,
                    ),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.confirmSignUp:
            return LogoScaffold(
              state: state,
              // A prebuilt Confirm Sign Up form from amplify_authenticator
              body: ConfirmSignUpForm(),
            );
          case AuthenticatorStep.resetPassword:
            return LogoScaffold(
              state: state,
              // A prebuilt Reset Password form from amplify_authenticator
              body: ResetPasswordForm(),
            );
          case AuthenticatorStep.confirmResetPassword:
            return LogoScaffold(
              state: state,
              // A prebuilt Confirm Reset Password form from amplify_authenticator
              body: const ConfirmResetPasswordForm(),
            );
          default:
          // Returning null defaults to the prebuilt authenticator for all other steps
            return null;
        }
      },
      child: MaterialApp(
        title: 'NewsBytes',
        debugShowCheckedModeBanner: false, // This line hides the debug banner
        themeMode: ThemeMode.dark, // hard set on dark mode theme for now
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey,
            backgroundColor: Colors.black,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            background: Colors.black,
            primary: Colors.red,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
        ),
        builder: Authenticator.builder(),
        home: const Scaffold(
          body: Center(
            // TODO: select one or the other
            child: Home(),
            // child: NewsFeed(),
          ),
        ),
      ),
    );
  }
}
