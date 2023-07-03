import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PageIndexProvider extends ChangeNotifier {
  final ItemScrollController itemScrollController = ItemScrollController();
 
  int index = 0;

  void setPageIndex(int index) {
    itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    this.index = index;

    notifyListeners();
  }
}
