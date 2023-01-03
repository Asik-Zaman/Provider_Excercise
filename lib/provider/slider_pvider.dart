import 'package:flutter/cupertino.dart';

class SliderProvider with ChangeNotifier {
  double _val = 0.0;
  double get value => _val;

  void newSlider(double value) {
    _val = value;
    notifyListeners();
  }
}
