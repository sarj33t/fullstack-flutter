import 'dart:convert';
import 'package:backend_api/services/user_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Router createRouter() {
  final userService = UserService();
  final router = Router();

  // Define the root route
  router.get('/', (Request request) {
    var data = {
      'status': 'success',
      'message': 'Hello, Dart Backend API!',
      'timestamp': DateTime.now().toIso8601String()
    };
    return Response.ok(json.encode(data),
        headers: {'Content-Type': 'application/json'});
  });

  // Define a route to fetch users from Firestore
  router.get('/users', (Request request) async {
    try {
      final users = await userService.fetchUsers();
      return Response.ok(jsonEncode({'users': users}),
          headers: {'Content-Type': 'application/json'});
    } catch (ex) {
      return Response.internalServerError(
          body: json.encode({'error': 'Failed to fetch data from Firestore'}));
    }
  });
  return router;
}
