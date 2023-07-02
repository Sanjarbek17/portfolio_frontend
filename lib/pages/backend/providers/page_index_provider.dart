import 'package:flutter/material.dart';

class PageIndexProvider extends ChangeNotifier {
  int _pageIndex = 3;
  int get pageIndex => _pageIndex;

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
