import 'dart:convert';
import 'package:dotenv/dotenv.dart';
import 'package:googleapis_auth/auth_io.dart';

/// [Authenticator]
class Authenticator{
  static AccessToken? _accessToken;

  // Fetch and return the access token if not expired, or generate a new one if expired
  static Future<String?> getAccessToken() async {
    // If the token is valid (not expired), return it
    if (_accessToken != null && !_accessToken!.hasExpired) {
      return _accessToken?.data;
    }
    // Otherwise, fetch a new access token
    return await _fetchNewAccessToken();
  }

  // Fetch a new access token
  static Future<String?> _fetchNewAccessToken() async {
    var env = DotEnv(includePlatformEnvironment: true)..load();

    final serviceAccountJson = env['FIREBASE_SERVICE_ACCOUNT_JSON'];

    if (serviceAccountJson == null) {
      throw Exception("Service account JSON is missing from .env file.");
    }
    final serviceAccountMap = json.decode(serviceAccountJson.trim());

    // Authenticate and get the new token
    final credentials = ServiceAccountCredentials.fromJson(json.encode(serviceAccountMap));

    final client = await clientViaServiceAccount(
      credentials,
      ['https://www.googleapis.com/auth/cloud-platform']
    );
    // Store the access token and set the expiry time
    _accessToken = client.credentials.accessToken;
    return _accessToken?.data;
  }
}