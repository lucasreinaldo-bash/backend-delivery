import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class PartnersApi {
  Handler get handler {
    Router router = Router();
    router.get('/partners', (Request req) {
      return Response.ok('List of Partners');
    });

    return router;
  }
}
