import 'package:backend_api/router/router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

/// [BackendAPIServer]
class BackendAPIServer{
  static void run() async{
    // Create the handler using the routes from lib
    final router = createRouter();

    // Create the pipeline that logs requests and then processes the routes
    var handler = const Pipeline()
        .addMiddleware(logRequests())
        .addHandler(router.call);

    // Start the server
    var server = await io.serve(handler, 'localhost', 8080);
    print('Server running on http://${server.address.host}:${server.port}');
  }
}