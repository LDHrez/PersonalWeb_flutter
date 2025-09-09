import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _menuOptions = [
    'home',
    'about',
    'services',
    'projects',
    'contact',
  ];

  int _currentPage = 0;

  createScrollController(String initialPage) {
    scrollController = PageController(initialPage: getPage(initialPage));
    scrollController.addListener(() {
      final newPage = (scrollController.page ?? 0).round();
      if (newPage != _currentPage){
        html.window.history.pushState(null, '', '/#/${_menuOptions[newPage]}');
        _currentPage = newPage;
      }



    });
  }

  goTo(int page) {
    html.window.history.pushState(null, '', '/#/${_menuOptions[page]}');

    scrollController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  getPage(String initialPage) {
    final index = _menuOptions.indexOf(initialPage);
    return (index == -1) ? 0 : index;
  }
}
