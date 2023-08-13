import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

/// A widget that displays a logo, a body, and an optional footer.
class LogoScaffold extends StatelessWidget {
  const LogoScaffold({
    super.key,
    required this.state,
    required this.body,
    this.footer,
  });

  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App logo
              Padding(
                padding: const EdgeInsets.only(top: 35),
                // child: Center(child: FlutterLogo(size: 100)),
                child: Center(
                    child: Image.asset(
                      "assets/images/last_build_run.png",
                      height: 200,
                    )
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: body,
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: footer != null ? [footer!] : null,
    );
  }
}

