import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class PartnersApi {
  Handler get handler {
    Router router = Router();

    //Listagem de Lojas
    router.get('/partners', (Request req) {
      return Response.ok('Listagem de Lojas');
    });

    //Adicao de nova Loja
    router.post('/partners', (Request req) {
      return Response.ok('Adicao de nova Loja');
    });

    //Atualizacao de uma loja existente  através de Query Parameters
    router.put('/partners', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('Objeto $id atualizado com sucesso');
    });

    //Delete de API
    router.delete('/partners', (Request req) {
      return Response.ok('Objeto deletado');
    });

    return router;
  }
}
