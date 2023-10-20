import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AuthUtil {

  Future<CognitoAuthSession> fetchCognitoAuthSession() async {
    try {
      final cognitoPlugin =
      Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      final result = await cognitoPlugin.fetchAuthSession();

      return result;
    } on AuthException catch (e) {
      // TODO: handle auth exception
      safePrint('Error retrieving auth session: ${e.message}');
      throw Exception('Error retrieving auth session: ${e.message}');
    }
  }

  Future<String> fetchAuthToken() async {
    final cognitoAuthSession = await fetchCognitoAuthSession();
    final accessToken = cognitoAuthSession.userPoolTokensResult.value.accessToken;
    safePrint("User Access Token: $accessToken");

    return accessToken.toJson();
  }

}