import 'package:shelf/shelf_io.dart' as shelf_io;

import 'server_handler.dart' as Server;

void main() async {
  var _server = Server.ServerHandler();

  final server = await shelf_io.serve(_server.handler, 'localhost', 8280);

  print('Server start http://localhost:8080');
}
