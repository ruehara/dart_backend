import 'dart:async';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'user/user_controller.dart';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  final router = Router();
  router.get('/', (Request request) {
    return Response.ok('Hello World');
  });

  router.mount('/user/', UserController().router);

  return router(request);
}
