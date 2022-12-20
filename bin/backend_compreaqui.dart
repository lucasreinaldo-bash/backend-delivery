import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'api/login_api.dart';
import 'api/partners_api.dart';
import 'infra/custom_server.dart';
import 'server_handler.dart' as Server;
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env');

  var cascadeHandler = Cascade()
      .add(
        LoginApi().handler,
      )
      .add(
        (PartnersApi().handler),
      )
      .handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
