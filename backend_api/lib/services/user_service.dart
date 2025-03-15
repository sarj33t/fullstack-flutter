import 'dart:convert';
import 'package:backend_api/auth/authenticator.dart';
import 'package:backend_api/constants/firebase_keys.dart';
import 'package:backend_api/services/firestore_service.dart';
import 'package:http/http.dart' as http;

/// [UserService]
class UserService extends FirestoreService{
  @override
  Future<List<Map<String, dynamic>>> fetchDocuments() async {
    final String url =
        '$firestoreBaseUrl/$projectId/databases/(default)/documents/${collectionName()}';

    var token = await Authenticator.getAccessToken();
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token', // OAuth2 token in the header
      },
    );

    if (response.statusCode == 200) {
      // Parse and return the response
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> documents = data['documents'] ?? [];
      return documents.map((doc) => doc['fields'] as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to fetch data from Firestore');
    }
  }

  Future<List<Map<String, dynamic>>> fetchUsers() async{
    return await fetchDocuments();
  }

  @override
  String collectionName() {
    return collectionUsers;
  }
}