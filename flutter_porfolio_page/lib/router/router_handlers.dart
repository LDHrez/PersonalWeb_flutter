import 'package:fluro/fluro.dart';

import 'package:flutter_porfolio_page/UI/pages/home_page.dart';
import 'package:flutter_porfolio_page/providers/page_provider.dart';
import 'package:provider/provider.dart';

final homeHandler = Handler(handlerFunc: (context, parameters) {
  
  final page = parameters['page']?.first;
  
  if (page != '/'){

    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    pageProvider.createScrollController(page!);
    return HomePage();
  }
  return null; 

});


