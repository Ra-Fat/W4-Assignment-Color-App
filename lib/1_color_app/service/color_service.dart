import 'package:flutter/material.dart';

enum CardType {
  red(Colors.red),
  blue(Colors.blue);

  final Color color;
  const CardType(this.color);
}


class ColorService extends ChangeNotifier {
  
  // Map to track tap count for each CardType
  final Map<CardType, int> _counts = {
    for (var type in CardType.values) type: 0,
  };


  //get the current tap count for a specific CardType 
  int getCount(CardType type) => _counts[type] ?? 0;

  // Get the private _counts to access all counts
  // read only
  Map<CardType, int> get counts => Map.unmodifiable(_counts);

  // increment method
  void increment(CardType type) {
    _counts[type] = (_counts[type] ?? 0) + 1;
    notifyListeners();
  }
}
