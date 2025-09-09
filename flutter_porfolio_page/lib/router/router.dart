import 'package:fluro/fluro.dart';
import 'package:flutter_porfolio_page/router/router_handlers.dart';

class FRouter
{
  static final FluroRouter router = FluroRouter();

  static void configureRoutes()
  {
    router.define('/:page', handler: homeHandler);

    //404 page not found
    router.notFoundHandler = homeHandler;
  }
}