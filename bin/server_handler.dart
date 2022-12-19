import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandler {
  Handler get handler {
    final router = Router();
    router.get('/', (Request request) {
      return Response(200, body: 'Primeira Rota', headers: {
        'context-type': 'text/html',
      });
    });

    router.get('/ola/mundo/<user>', (Request req, String user) {
      return Response(200, body: 'Ola mundo $user');
    });

    //http://localhost:8080/query?cpf=04486557565
    router.get('/query', (Request req) {
      String? queryParameters = req.url.queryParameters['cpf'];
      return Response.ok('Query é: $queryParameters');
    });

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);
      var userName = json['user'];

      if (userName == 'lucas.reinaldo') {
        Map jsonResult = {'token': '323', 'user': 'lucas'};
        String jsonReturn = jsonEncode(jsonResult);
        return Response.ok(jsonReturn, headers: {
          'content-type': 'application/json',
        });
      } else {
        return Response.forbidden('Acesso negado');
      }
    });

    return router;
  }
}
