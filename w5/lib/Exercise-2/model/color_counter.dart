import 'package:flutter/material.dart';

// Create this new countModel to count the value when we click
class CounterModel extends ChangeNotifier {
  int _redCount = 0;
  int _blueCount = 0;

  int get redCount => _redCount;
  int get blueCount => _blueCount;

  void incrementRed() {
    _redCount++;
    notifyListeners(); // Notify UI to update
  }

  void incrementBlue() {
    _blueCount++;
    notifyListeners(); // Notify UI to update
  }
}
