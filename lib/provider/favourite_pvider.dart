import 'package:flutter/cupertino.dart';

class FavProvider with ChangeNotifier {
  List<int> _selectedIndex = [];
  List<int> get selectedIndex => _selectedIndex;

  void addItems(int value) {
    _selectedIndex.add(value);
    notifyListeners();
  }

  void removeItems(int value) {
    _selectedIndex.removeAt(value);
    notifyListeners();
  }
}
