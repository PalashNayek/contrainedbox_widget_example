import 'package:flutter/material.dart';

class ConstrainedBoxViewModel extends ChangeNotifier {
  double minWidth = 100.0;
  double minHeight = 100.0;
  double maxWidth = 200.0;
  double maxHeight = 200.0;

  // Method to update constraints
  void updateConstraints({
    double? newMinWidth,
    double? newMinHeight,
    double? newMaxWidth,
    double? newMaxHeight,
  }) {
    minWidth = newMinWidth ?? minWidth;
    minHeight = newMinHeight ?? minHeight;
    maxWidth = newMaxWidth ?? maxWidth;
    maxHeight = newMaxHeight ?? maxHeight;
    notifyListeners();
  }
}
